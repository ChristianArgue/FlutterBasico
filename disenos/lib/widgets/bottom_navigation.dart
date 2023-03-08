import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'Llamada'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_end),
          label: 'Colgar'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          label: 'Compartir'
        )
      ]
    );
  }
}