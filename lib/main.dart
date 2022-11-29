import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/product.dart';
import 'package:myapp/pages/login.dart';

void main(List<String> args) => runApp(new MyApp());

//StatefullWidget
class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomEnglishWordsState();
  }
}

//State
class RandomEnglishWordsState extends State<RandomEnglishWords> {
  final _words = <WordPair>[];
  final _checkedWords = new Set<
      WordPair>(); // Set contains "giống mảng nhưng k có phần tử trùng nhau"
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    // final wordPair = new WordPair.random();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List of english words'),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final color = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkedWords.contains(wordPair);
    return new ListTile(
      //leading =left, trailing = right.
      leading: new Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: color,
      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color: color),
      ),
      onTap: () {
        // giống onclick
        setState(() {
          if (isChecked) {
            _checkedWords.remove(wordPair);
          } else {
            _checkedWords.add(wordPair);
          }
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return new MaterialApp(
        title: "This is my first Flutter App",
        // home: new Scaffold(
        //   appBar: new AppBar(
        //     title: new Text('Đây là Headder'),
        //   ),
        //   body: new Center(child: new RandomEnglishWords()),
        // ),
        // home: new RandomEnglishWords(),
        home: MyHomePage2());
  }
}
