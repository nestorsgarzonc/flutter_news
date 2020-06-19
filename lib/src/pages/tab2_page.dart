import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/category_model.dart';
import 'package:flutter_news/src/services/news_services.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: _ListaCategorias()),
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
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
                _CategoryButton(categorie: categories[index]),
                SizedBox(height: 5),
                Text(
                  "${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({@required this.categorie});

  final Category categorie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('${categorie.name}');
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(categorie.icon, color: Colors.black54),
      ),
    );
  }
}
