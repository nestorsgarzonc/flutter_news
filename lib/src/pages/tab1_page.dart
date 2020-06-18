import 'package:flutter/material.dart';
import 'package:flutter_news/src/services/news_services.dart';
import 'package:flutter_news/src/widgets/list_notices.dart';

import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Center(
        child: (newService.headlines.length == 0)
            ? CircularProgressIndicator()
            : ListNewsWidget(news: newService.headlines),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; //True if i want to keep the state

}
