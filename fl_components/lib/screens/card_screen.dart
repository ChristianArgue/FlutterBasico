import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(name: 'Un hermoso Paisaje', imgUrl: 'http://cdn.eso.org/images/screen/millour-01-cc.jpg',),
          SizedBox(height: 10),
          CustomCardType2(imgUrl: 'https://mymodernmet.com/wp/wp-content/uploads/2020/11/International-Landscape-Photographer-Year-PhotographER-1st-KelvinYuen-2.jpg',),
          SizedBox(height: 10),
          CustomCardType2(imgUrl: 'https://mymodernmet.com/wp/wp-content/uploads/2020/02/Landscape-Photographer-of-the-Year-Sander-Grefte.jpg',),
          SizedBox(height: 10),
          CustomCardType2(imgUrl: 'https://images.squarespace-cdn.com/content/v1/592df00e3a0411d38a6c0e88/1612639950564-GYA9FXSRHNM4NP4CLP5Y/arterra-landscape-architects-carmel-california-02.jpg?format=2500w',),
          SizedBox(height: 50,)
        ],
      )
   );
  }
}

