import 'package:flutter/material.dart';

import 'package:fl_components/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album, color: AppTheme.primary,),
            title: Text('Soy un titulo'),
            subtitle: Text('Dolor id ut amet tempor laboris dolor nostrud. Irure non eu do deserunt sit laborum aliqua. Veniam ea quis mollit reprehenderit nostrud ipsum anim adipisicing irure dolore veniam exercitation amet. '),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('OK')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}