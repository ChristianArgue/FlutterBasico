import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

import '../ui/input_decorations.dart';


class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductServices>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService,),
    );

    // return _ProductScreenBody(productService: productService);
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductServices productService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: productService.selectedProduct.picture,),
                Positioned(
                  top: 90,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new_rounded, size: 40, color: Colors.white,),
                  )
                ),
                Positioned(
                  top: 90,
                  right: 25,
                  child: IconButton(
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100
                      );
                      if(pickedFile == null){
                        print('No selecciono nada');
                        return;
                      }
                      print('Tenemos imagen ${pickedFile.path}');
                      productService.updateSelectedProductImage(pickedFile.path);
                    },
                    icon: Icon(Icons.camera_alt_rounded, size: 40, color: Colors.white,),
                  )
                ),
              ],
            ),
            _ProductForm(),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt_rounded),
        onPressed:() async {
          if(!productForm.isValidForm()) return;
          await productService.saveOrCreateProduct(productForm.product);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
   );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if(value == null || value.length < 1 )
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', 
                  labelText: 'Nombre: '
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) {
                  if(double.tryParse(value) == null ){
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                validator: (value) {
                  if(value == null || value.length < 1 )
                    return 'El nombre es obligatorio';
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Precio: '
                ),
              ),
              SizedBox(height: 30,),
              SwitchListTile.adaptive(
                value: product.available, 
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: (value) {
                  productForm.updateAvailability(value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}