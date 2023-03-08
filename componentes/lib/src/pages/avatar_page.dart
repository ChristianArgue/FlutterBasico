import 'package:flutter/material.dart';

class Avatarpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              foregroundImage: NetworkImage('https://i2.wp.com/hipertextual.com/wp-content/uploads/2018/05/deadpool-2-love-2389472389443.jpg?fit=1200%2C900&ssl=1'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://depor.com/resizer/YrQxuGizG6VvGnQTlDWlGiaUd84=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/6KKTOJNROJHQNIZ5PJJVO37MCU.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}