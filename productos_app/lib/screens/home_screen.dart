import 'package:flutter/material.dart';
import 'package:productos_app/models/model.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productServices = Provider.of<ProductServices>(context);

    if(productServices.isloading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productServices.products.length,
        itemBuilder: (context, int index) => GestureDetector(
          onTap: () {
            productServices.selectedProduct = productServices.products[index].copy();
            Navigator.pushNamed(context, 'productos');
          },
          child: ProductCard(product: productServices.products[index])
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productServices.selectedProduct = new Product(
            available: true, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, 'productos');
        },
      ),
   );
  }
}