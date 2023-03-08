import 'package:flutter/material.dart';


class BasicDesignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen
          Image(image: AssetImage('assets/landscape.jpg')),
          //titulo
          Title(),
          //Button Section
          ButtonSection(),
          //Description
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text('Nulla cillum exercitation minim laboris ad id amet aliqua velit laboris. Irure laboris occaecat deserunt reprehenderit exercitation laborum sit amet. Ex minim exercitation duis laborum excepteur minim ad nisi ut laborum laborum non magna.')
          )
        ],
      )
   );
  }
}


class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.black45),),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.red,),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(icon: Icons.call, text: 'CALL',),
          CustomButton(icon: Icons.send_rounded, text: 'ROUTE',),
          CustomButton(icon: Icons.share, text: 'SHARE',),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String text;

  const CustomButton({
    Key? key, 
    required this.icon, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Icon(this.icon, color: Colors.blue[400], size: 30,),
          Text(this.text, style: TextStyle(color: Colors.blue[400])),
        ],
      );
  }
}