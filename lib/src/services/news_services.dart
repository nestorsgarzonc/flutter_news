import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  List<Article> articles = [];
  final _urlNews = 'https://newsapi.org/v2';
  final _apiKEY = '6f81ea167e4d473aa5e9472b27f4fd81';
  NewsService() {
    getTopHeadlines();
  }

  void getTopHeadlines() async {
    final url = '$_urlNews/top-headlines?country=co&apiKey=$_apiKEY';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    articles.addAll(newsResponse.articles);
    notifyListeners();
  }
}
