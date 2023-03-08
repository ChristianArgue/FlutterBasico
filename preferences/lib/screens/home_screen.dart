import 'package:flutter/material.dart';
import 'package:preferences/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  static const routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('isDarkMode: true'),
          Divider(),
          Text('Genero: 1'),
          Divider(),
          Text('Nombre de Usuario: Christian '),
          Divider(),
        ],
      )
   );
  }
}