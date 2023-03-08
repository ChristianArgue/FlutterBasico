import 'package:flutter/material.dart';
//import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
     // home: HomePage()
      initialRoute: 'home',
      routes: getApplicationRoutes(),
      //onGenerateRoute: (settings){
        //print('Ruta llamada: ${settings.name}');

        //return MaterialPageRoute(
          //builder: (BuildContext context) => Alertpage()
        //);
      //},
    );
  }
}