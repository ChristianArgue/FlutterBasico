import 'package:flutter/material.dart';
import 'package:noticias/pages/tabs_pages.dart';
import 'package:noticias/services/news_services.dart';
import 'package:noticias/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => NewsServices())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: const TabsPage()
      ),
    );
  }
}