import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/category_model.dart';
import 'package:flutter_news/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyballBall, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  final _urlNews = 'https://newsapi.org/v2';
  final _apiKEY = '6f81ea167e4d473aa5e9472b27f4fd81';
  NewsService() {
    getTopHeadlines();
  }

  void getTopHeadlines() async {
    final url = '$_urlNews/top-headlines?country=co&apiKey=$_apiKEY';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
