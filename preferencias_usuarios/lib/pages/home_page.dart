// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:preferencias_usarios/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuarios'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text('Color Secundario: '),
          Divider(),
          Text('Genero: '),
          Divider(),
          Text('Nomnbre: '),
          Divider(),
        ],
      ),
    );
  }
}