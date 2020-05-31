import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double padding = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Alfabeto",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            "A",
            style: TextStyle(
              fontSize: 400,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: <Widget>[
              Text("Texto 1"),
              Text("Texto 2"),
              Text("Texto 3"),
            ],
          ),
        ),
      ),
    );

  }
}
