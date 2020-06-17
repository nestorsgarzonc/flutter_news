import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/news_models.dart';

class NewsService with ChangeNotifier {
  List<Article> articles;

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Loading headlines');
  }
}
