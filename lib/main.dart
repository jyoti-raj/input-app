import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() => runApp(X());

class X extends StatelessWidget {
  TextEditingController myController1 = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  String cmd;

  enteredText(String cmd) async {
    var url = "http://192.168.43.83/cgi-bin/cal.py?x=$cmd";
    var response = await http.get(url);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input Feild'),
        ),
        backgroundColor: Colors.grey.shade400,
        body: Center(
            child: Container(
          width: 350,
          height: 250,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  cmd = value;
                },
                controller: myController1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'enter redHat command',
                  border: OutlineInputBorder(),
                ),
                autocorrect: false,
              ),
              // TextField(
              //   controller: myController2,
              //   textAlign: TextAlign.center,
              //   decoration: InputDecoration(
              //     hintText: 'Enter image name',
              //     border: OutlineInputBorder(),
              //   ),
              //   autocorrect: true,
              // ),
              FlatButton(
                onPressed: () {
                  // print(myController1.text);
                  enteredText(myController1.text);
                  // print(myController2.text);
                },
                child: Text('Submit'),
                color: Colors.blue,
              )
            ],
          ),
        )),
      ),
    );
  }
}
