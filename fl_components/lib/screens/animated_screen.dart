import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  
  final random = Random();
  double _width = 10;
  double _height = 10;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);
  
  void changeShape(){
    setState(() {
      _width = random.nextInt(300).toDouble()+70;
      _height = random.nextInt(300).toDouble()+70;
      _color = Color.fromRGBO(
        random.nextInt(256), 
        random.nextInt(256), 
        random.nextInt(256), 
        1
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble()+10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
          ), 
          duration: const Duration(seconds: 1),
          curve: Curves.bounceOut,
        )
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: changeShape,
       child: const Icon(Icons.play_arrow_rounded),
     ),
   );
  }
}