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
        SizedBox(height: 10),
        _TarjetaTopBar(noticia: noticia, index: index),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia: noticia),
        _TarjetaBotones(),
        SizedBox(height: 10),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.save_alt),
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text((noticia.description != null) ? noticia.description : ' '),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: (noticia.urlToImage != null)
            ? FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif'),
                image: NetworkImage(noticia.urlToImage),
              )
            : AssetImage('assets/img/no-image.png'),
      ),
    );
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
          Text('${index + 1}. ', style: TextStyle(color: myTheme.accentColor)),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}
