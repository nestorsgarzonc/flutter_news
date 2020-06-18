import 'package:flutter/material.dart';
import 'package:flutter_news/src/services/news_services.dart';
import 'package:flutter_news/src/widgets/list_notices.dart';

import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Center(
        child: ListNewsWidget(news: newService.headlines),
      ),
    );
  }
}
