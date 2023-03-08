import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(icon: Icons.pie_chart_sharp, color: Colors.blue, text: 'General',),
            _SingleCard(icon: Icons.car_rental, color: Colors.pinkAccent, text: 'Transport',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.card_giftcard_rounded, color: Colors.indigo, text: 'Regalo',),
            _SingleCard(icon: Icons.move_to_inbox, color: Colors.red, text: 'Inbox',),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.qr_code, color: Colors.orange, text: 'Codigo',),
            _SingleCard(icon: Icons.tab_rounded, color: Colors.purple, text: 'Guardar',),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    Key? key, 
   required this.icon, 
   required this.color, 
   required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: this.color,
            child: Icon(this.icon, size: 35, color: Colors.white,),
            radius: 30,
          ),
          SizedBox(height: 10,),
          Text( this.text, style: TextStyle(color: this.color, fontSize: 18 ) ,)
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5 ),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}