import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class ListViewScreen extends StatelessWidget {

  final opciones = const['Megaman', 'Metal Gear', 'Super Smash', 'Final Fantasy'];

  const ListViewScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView tipo 1'),
      ),
      body: ListView(
        children: [
          ...opciones.map(
            (game) =>  ListTile(
              leading: const Icon(Icons.access_time_sharp, color: AppTheme.primary,), 
              title: Text(game),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.primary,),
            )
          ).toList()
          
        ],
      )
   );
  }
}