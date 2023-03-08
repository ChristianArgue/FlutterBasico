import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Historial')),
        actions: [
          IconButton(
            onPressed: () => null, 
            icon: const Icon(Icons.delete_forever_rounded)
          )
        ],
        elevation: 0,
      ),
      body: const _HomePageBpdy() ,
     floatingActionButton: const ScanBottom(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar: const CustomNavigatorBar(),
   );
  }
}

class _HomePageBpdy extends StatelessWidget {
  const _HomePageBpdy({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex){
      case 0:
        return const MapasPage();
      case 1:
        return const DirecionesPage();
      default:
        return const MapasPage();
    }     

  }
}