import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.indigo;
  static const Color primary2 = Colors.red;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Color Primario
    primaryColor: Colors.indigo,
    //AppBa Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),

    //TextButom Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primary
      ),
    ),

    //FloatingActionButtom Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0
    ),

    //ElevatedButtom Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 0
      )
    ),

    //Inputs Decoretion
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ), 
    )
  );

  
  
  
  
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      color: primary2,
      elevation: 0
    ),
    scaffoldBackgroundColor: Colors.black,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primary
      ),
    ),
  );

}