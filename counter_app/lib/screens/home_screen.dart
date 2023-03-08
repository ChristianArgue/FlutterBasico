import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle fontSize30 = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home Screen')),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Clicks Counter', style: fontSize30),
            Text('0', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one_rounded),
        onPressed: (){},
      ),
    );
  }
}