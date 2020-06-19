import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/category_model.dart';
import 'package:flutter_news/src/services/news_services.dart';
import 'package:flutter_news/src/theme/theme.dart';
import 'package:flutter_news/src/widgets/list_notices.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategorias(),
            Expanded(
              child: ListNewsWidget(news: newsService.getArticlesSelectedCategory),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context, listen: false).categories;
    return Container(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 105,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _CategoryButton(category: categories[index]),
                  SizedBox(height: 5),
                  Text(
                    "${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({@required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<NewsService>(context);
    final isSameCategory = categoryProvider.selectedCategory == category.name;
    return GestureDetector(
      onTap: () {
        categoryProvider.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSameCategory ? myTheme.accentColor : Colors.white,
        ),
        child: Icon(category.icon, color: isSameCategory ? Colors.white : Colors.black54),
      ),
    );
  }
}
