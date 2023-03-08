import 'package:flutter/material.dart';
import 'package:noticias/pages/tab1_page.dart';
import 'package:noticias/pages/tab2_page.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
       ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      selectedItemColor: Colors.red,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Para ti",
        ), 
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: "Encabezados",
        ),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{
  
  int _paginaactual = 0;
  
  PageController _pageController = new PageController();
  
  int get paginaActual => _paginaactual;
  
  set paginaActual(int valor){
    _paginaactual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInQuad);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}