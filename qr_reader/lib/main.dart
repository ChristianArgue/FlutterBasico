import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => const HomePage(),
          'mapa': ( _ ) => const MapaPage(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}