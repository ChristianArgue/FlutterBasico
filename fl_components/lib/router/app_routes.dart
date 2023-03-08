import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';


class AppRoutes {

  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    // MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home_max_rounded),
    MenuOption(route: 'listView1', name: 'ListView tipo 1', screen: const ListViewScreen(), icon: Icons.list),
    MenuOption(route: 'listView2', name: 'ListView tipo 2', screen: const ListView2Screen(), icon: Icons.list_alt_rounded),
    MenuOption(route: 'alert', name: 'Alertas - Alerts', screen: const AlertScreen(), icon: Icons.add_alert_rounded),
    MenuOption(route: 'card', name: 'Tarjetas - Cards', screen: const CardScreen(), icon: Icons.credit_card_rounded),
    MenuOption(route: 'avatar', name: 'Circule Avatar', screen: const AvatarScreen(), icon: Icons.supervised_user_circle_rounded),
    MenuOption(route: 'animated', name: 'Animated Container', screen: const AnimatedScreen(), icon: Icons.play_circle_outline_rounded),
    MenuOption(route: 'inputs', name: 'Text Inputs', screen: const InputsScreen(), icon: Icons.input_rounded),
    MenuOption(route: 'slider', name: 'Slider and Checks', screen: const SliderScreen(), icon: Icons.check_box_outline_blank_rounded),
    MenuOption(route: 'listViewBuilder', name: 'InfiniScroll', screen: const ListViewBuilderScreen(), icon: Icons.assessment_sharp),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({ 'home': (BuildContext context) => const HomeScreen()});
    
    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen,});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home'     : (BuildContext context) => const HomeScreen(),
  //   'ListView1': (BuildContext context) => const ListViewScreen(),
  //   'listView2': (BuildContext context) => const ListView2Screen(),
  //   'alert'    : (BuildContext context) => const AlertScreen(),
  //   'card'     : (BuildContext context) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen() ,
    );
  }
}