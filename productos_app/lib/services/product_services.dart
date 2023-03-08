import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/model.dart';
import 'package:http/http.dart' as http;


class ProductServices extends ChangeNotifier {
  
  final String _baseUrl = 'flutter-varios-21d6d-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  File? newPictureFile;

  bool isloading = true;
  bool isSaving = false;

  ProductServices(){
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    this.isloading = true;
    notifyListeners();
    
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(resp.body);
    
    productMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    this.isloading = false;
    notifyListeners();

    return this.products;
  } 

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if(product.id == null){
      //TODO: Es necesario crear
      await this.createProduct(product);
    } else {
      //TODO: Actualizar
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async{
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodeData = resp.body;

    final index = this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;
    return product.id!;
  }

  Future<String> createProduct(Product product) async{
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodeData = json.decode(resp.body);
    product.id = decodeData['name'];
    this.products.add(product);
    return product.id!;
  }

  void updateSelectedProductImage(String path){
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
}