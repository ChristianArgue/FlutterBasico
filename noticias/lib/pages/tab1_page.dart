import 'package:flutter/material.dart';
import 'package:noticias/services/news_services.dart';
import 'package:noticias/theme/tema.dart';
import 'package:noticias/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsServices>(context).headLine;
    // newsServices.headLine

    return Scaffold(
      body: (headlines.length == 0)
          ? Center(child: CircularProgressIndicator(color: miTema.colorScheme.secondary,))
          : ListaNoticias(noticias: headlines)
   );
  }
  
  @override
  bool get wantKeepAlive => true;
}