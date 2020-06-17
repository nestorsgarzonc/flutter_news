import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/news_models.dart';

class ListNewsWidget extends StatelessWidget {
  final List<Article> news;

  const ListNewsWidget({@required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(news[index].title);
      },
    );
  }
}
