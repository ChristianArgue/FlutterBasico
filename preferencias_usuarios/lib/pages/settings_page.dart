// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:preferencias_usarios/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  late TextEditingController _textController; 

  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    cargarPref();
    _textController = TextEditingController(text: _nombre);
  }

  cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero')!;
    setState(() {});
  }

  _setSelectedRadio(int? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('genero', valor!);
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            onChanged: (value){
              setState(() {
                _colorSecundario = value;
              });
            },
            title: Text('Color Secundario'),
          ),
          RadioListTile(
            value: 1, 
            groupValue: _genero, 
            onChanged: _setSelectedRadio, 
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2, 
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona'
              ),
              onChanged: (value){},
            ),
          )
        ],
      )
    );
  }
}