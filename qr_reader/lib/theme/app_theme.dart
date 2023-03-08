import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: primary
      ),
      selectedItemColor: primary
    )
    
  );

}