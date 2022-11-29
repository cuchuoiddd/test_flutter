import 'package:flutter/material.dart';

  
class MyHomePage2 extends StatefulWidget {  
  @override  
  _State createState() => _State();  
}  
  
class _State extends State<MyHomePage2> {  
  TextEditingController nameController = TextEditingController();  
  TextEditingController passwordController = TextEditingController();  
  @override  
  Widget build(BuildContext context) {  
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
        
    return Scaffold(  
        appBar: AppBar(  
          title: Text('Flutter TextField Example'),  
        ),  
        body: Padding(  
            padding: EdgeInsets.all(15),  
            child: Column(  
              children: <Widget>[  
                Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    controller: nameController,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'User Name',  
                      hintText: 'Enter Your Name',  
                    ),  
                  ),  
                ),  
                Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    controller: passwordController,  
                    obscureText: true,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Password',  
                      hintText: 'Enter Password',  
                    ),  
                  ),  
                ),  
                ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
              ],  
            )  
        )  
    );  
  }  
}  