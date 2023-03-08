import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY   = '8d26745989de42a4b4b72c1554fc08a2';

class NewsServices with ChangeNotifier{
  List<Article> headLine = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertaiment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  NewsServices() {
    this.getTopHeadLine();
  }
  getTopHeadLine() async {
    
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=co&apiKey=$_APIKEY');

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headLine.addAll(newsResponse.articles);
    notifyListeners();

  }
}