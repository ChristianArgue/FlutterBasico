import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
          title: const Text('Titulo'),
          content: Column(
            children: const [
              Text('Contenido de la alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('OK')
            ),
          ],
        );
      }
    );
  }

  void displayDialogAndroid(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)
          ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Contenido de la alerta'),
            SizedBox(height: 10),
            FlutterLogo(size: 100)
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
          ),
          TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('OK')
            ),
        ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Mostrar Alerta', style: TextStyle(fontSize: 20),),
          ),
          onPressed: () => Platform.isAndroid
           ? displayDialogAndroid(context) 
           : displayDialogIOS(context), 
        ),
     ),
     floatingActionButton: FloatingActionButton(
       child: const Icon(Icons.close_rounded),
       onPressed: () => Navigator.pop(context)
      ),
   );
  }
}