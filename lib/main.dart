import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    // final wordPair = new WordPair.random();
    final _words = <WordPair>[];
    // return new Text(
    //   wordPair.asUpperCase,
    //   style: new TextStyle(fontSize: 22.0),
    // );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List of english words'),
      ),
      body: new ListView.builder(itemBuilder: (context,index){

        if(index >= _words.length){
          _words.addAll(generateWordPairs().take(10));
        }
         return _buildRow(_words[index]);
      }),
    );
  }
}
Widget _buildRow(WordPair wordPair){
  return new ListTile(
    title: new Text(
      wordPair.asUpperCase,
      style: new TextStyle(fontSize: 18.0,color: Colors.red),
      ),
  );
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
      home: new RandomEnglishWords(),
    );
  }
}
