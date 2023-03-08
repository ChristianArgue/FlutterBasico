import 'package:flutter/material.dart';


class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stan Lee'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: const Text('SL'),
              backgroundColor: Colors.indigo[900],
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage('https://depor.com/resizer/x5TXreFqDLDz5faIjPCXGyz6cco=/1200x800/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/6KKTOJNROJHQNIZ5PJJVO37MCU.jpg'),
        )
     ),
   );
  }
}