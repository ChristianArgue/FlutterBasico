import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify transaction', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 5),
            Text('Classify this transaction into a particular category', style: TextStyle(fontSize: 20, color: Colors.white))
          ],
        ),
      ),
    );
  }
}