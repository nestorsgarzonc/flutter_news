import 'package:flutter/material.dart';
import 'package:flutter_news/src/models/news_models.dart';
import 'package:flutter_news/src/theme/theme.dart';

class ListNewsWidget extends StatelessWidget {
  final List<Article> news;

  const ListNewsWidget({@required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(index: index, noticia: news[index]);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final num index;
  const _Noticia({@required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia: noticia, index: index),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia)
      ],
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final num index;
  const _TarjetaTopBar({Key key, this.noticia, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}', style: TextStyle(color: myTheme.accentColor)),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}
