import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/product.dart';
import 'package:myapp/pages/login.dart';
import 'package:myapp/pages/randomEnglish.dart';

void main(List<String> args) => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return new MaterialApp(
        title: "This is my first Flutter App",
        // routes: {
        //   '/': (context) => MyHomePage(),
        //   '/login': (context) => LoginPage(),
        //   '/product': (context) => ProductPage(),
        // },
        // home: new Scaffold(
        //   appBar: new AppBar(
        //     title: new Text('Đây là Headder'),
        //   ),
        //   body: new Center(child: new RandomEnglishWords()),
        // ),
        home: LoginPage());
    // home: MyHomePage2());
  }
}