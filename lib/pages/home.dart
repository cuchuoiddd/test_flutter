import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 '$_counter',
//               ),
//               TextButton(
//                 onPressed: _incrementCounter,
//                 child: const Text('Add number'),
//               ),
//             ]),
//       ),
//     );
//   }
// }

class _MyAppState extends State<MyHomePage> {
  int _count = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scaffold Example'),
      ),
      body: Banner(
        message: 'Offer 20% off',
        location: BannerLocation.topStart,
        color: Colors.red,
        child: Container(
          height: 150,
          width: double.infinity,
          color: Colors.lightGreen,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Image.network(
                    "https://raw.githubusercontent.com/o7planning/rs/master/flutter/fast_food.png"),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text("Fast Food",
                        style: TextStyle(fontSize: 30, color: Colors.blue)),
                    SizedBox(height: 10),
                    Text("Description ....",
                        style: TextStyle(fontStyle: FontStyle.italic))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black12,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            this._count++;
          });
        },
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
