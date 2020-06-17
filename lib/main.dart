import 'package:flutter/material.dart';
import 'package:flutter_news/src/pages/tabs_page.dart';
import 'package:flutter_news/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TabsPage(),
      debugShowCheckedModeBanner: false,
      theme: myTheme,
    );
  }
}
