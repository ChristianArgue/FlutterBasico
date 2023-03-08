import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_components/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final menuOption = AppRoutes.menuOption;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading:  Icon(menuOption[index].icon, color: AppTheme.primary),
          title: Text(menuOption[index].name),
          onTap: (){
            // final route = MaterialPageRoute(
            //   builder: (context) => const ListViewScreen()
            // );
            // Navigator.push(context, route);
            Navigator.pushNamed(context, menuOption[index].route);
          },
        ), 
        separatorBuilder: ( _ , __ ) => const Divider(),
        itemCount: menuOption.length
      )
   );
  }
}