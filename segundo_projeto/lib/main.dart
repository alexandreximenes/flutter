import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  double padding = 16;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
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
    ),
  ));
}
