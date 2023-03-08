import 'package:flutter/material.dart';
import 'package:productos_app/models/model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({ 
    Key? key, 
    required this.product 
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackGrounImage(url: product.picture),
            _ProductDetails(title: product.name, subtitle: product.id!,),
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(precio: product.price,)
            ),
            if(!product.available)
              Positioned(
                top: 0,
                left: 0,
                child: _NotAviable()
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0,5),
             blurRadius: 10
          )
        ]
      );
  }
}

class _NotAviable extends StatelessWidget {
  const _NotAviable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No Disponible', style: TextStyle(fontSize: 20, color: Colors.white),), 
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), topLeft: Radius.circular(25) )
      ),
    );
  }
}


class _BackGrounImage extends StatelessWidget {
  const _BackGrounImage({
    Key? key, 
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
          ? Image(
            image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
          )
          : FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key, 
    required this.title, 
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _builBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, 
              style: TextStyle(
                fontSize: 20, 
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ), 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle, 
              style: TextStyle(
                fontSize: 15, 
                color: Colors.white,
              ), 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _builBoxDecoration() => BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
  );
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key, 
    required this.precio,
  }) : super(key: key);

  final double precio;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 ),
          child: Text('\$$precio', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
    );
  }
}