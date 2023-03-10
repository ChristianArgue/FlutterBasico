import 'package:flutter/material.dart';

class Alertpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta', style: TextStyle(fontSize: 20)),
          onPressed: () => _mostrarAlerta(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[400],
            shape: StadiumBorder()
          ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0)
            ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('cancelar'),
                onPressed: () => Navigator.of(context).pop(),
                ),
              TextButton(
                child: Text('Ok'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                ),
            ],
        );
      }
    );
  }
}