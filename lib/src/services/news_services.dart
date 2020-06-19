import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/category_model.dart';
import 'package:flutter_news/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final _urlNews = 'https://newsapi.org/v2';
  final _apiKEY = '6f81ea167e4d473aa5e9472b27f4fd81';

  List<Article> headlines = [];
  String _selectedCategory = 'business';
  Map<String, List<Article>> categoryArticles = {};

  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.volleyballBall, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  get selectedCategory => _selectedCategory;
  set selectedCategory(String category) {
    _selectedCategory = category;
    getArticlesByCategory(category);
    notifyListeners();
  }

  NewsService() {
    getTopHeadlines();
    categories.forEach((item) {
      categoryArticles[item.name] = List();
    });
    //getArticlesByCategory(_selectedCategory);
  }

  void getTopHeadlines() async {
    final url = '$_urlNews/top-headlines?country=co&apiKey=$_apiKEY';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  List<Article> get getArticlesSelectedCategory {
    return categoryArticles[selectedCategory];
  }

  void getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      return;
    }
    final url = '$_urlNews/top-headlines?country=co&category=$category&apiKey=$_apiKEY';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();
  }
}
