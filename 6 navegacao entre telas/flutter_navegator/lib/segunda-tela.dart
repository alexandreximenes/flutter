import 'package:flutter/material.dart';

class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
             Text("Segunda tela")
            ],
          ),
        ),
      ),
    );
  }
}
