import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
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
                  onPressed: () {
                    final text = nameController.text == "ngonngay" &&
                            passwordController.text == "123"
                        ? 1
                        : 0;

                    final data = jsonEncode(<String, String>{
                      'title': 'foo',
                      'body': 'bar',
                      'userId': '1',
                    });
                    final check = postData('https://jsonplaceholder.typicode.com/posts',data);
// debugPrint('data: $check');
                    if(check == "true"){
                      Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MyHomePage()) );
                    } else {
                        showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text(
                                'Tài khoản hoặc mk không đúng, vui lòng thử lại'),
                          );
                        },
                      );
                    }

                    // final response = getData('https://jsonplaceholder.typicode.com/albums/1');
                    // debugPrint('data: $response');

                    return;
                    if (text == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text(
                                'Tài khoản hoặc mk không đúng, vui lòng thử lại'),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Enabled'),
                ),
              ],
            )));
  }
}

Future<void> getData(url) async {
  final response =
      await http.get(Uri.parse(url));
  final data = jsonDecode(response.body);
  // return data;
  print(data);
  print(data['title']);

  // return data['userId'];
}

Future<void> postData(url,data) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: data,
  );
  return data;
  // return Future<bool>.value(true);
  print(response.body);
}