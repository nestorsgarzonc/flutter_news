import 'package:flutter/material.dart';
import 'package:flutter_news/src/services/news_services.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NavigatorModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigator(),
      ),
    );
  }
}

class _Navigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigatorModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (index) => navigationModel.actualPage = index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Para ti')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados')),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<_NavigatorModel>(context).pageController;
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(color: Colors.grey),
        Container(color: Colors.teal),
      ],
    );
  }
}

class _NavigatorModel with ChangeNotifier {
  num _actualPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  num get actualPage => this._actualPage;
  get pageController => this._pageController;

  set actualPage(num index) {
    _actualPage = index;
    _pageController.animateToPage(
      index,
      curve: Curves.ease,
      duration: Duration(milliseconds: 250),
    );
    notifyListeners();
  }
}
