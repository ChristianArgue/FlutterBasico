import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class ListView2Screen extends StatelessWidget {

  final opciones = const['Megaman', 'Metal Gear', 'Super Smash', 'Final Fantasy'];

  const ListView2Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView tipo 2'),
      ),
      body: ListView.separated(
        itemCount: opciones.length, 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(opciones[index]),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.primary),
            onTap: () {
              
            },
          );
        }, 
        separatorBuilder: (context, index) => const Divider(),
      )
   );
  }
}