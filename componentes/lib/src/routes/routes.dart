import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
// import 'package:componentes/src/pages/video_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder>{
    'home'   : (BuildContext context) => HomePage(),
    'alert'  : (BuildContext context) => Alertpage(),
    'avatar' : (BuildContext context) => Avatarpage(),
    'card'   : (BuildContext context) => CardPage(),
    'animatedcontainer' : (BuildContext context) => AnimatedContainerPage(),
    'inputs' : (BuildContext context) => InputPage(),
    'slider' : (BuildContext context) => SliderPage(),
    'list'   : (BuildContext context) => ListaPage(),
    // 'video' : (BuildContext context) => VideoPage()
  };
 
}

