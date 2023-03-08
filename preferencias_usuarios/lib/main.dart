// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:preferencias_usarios/pages/home_page.dart';
import 'package:preferencias_usarios/pages/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName     : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}