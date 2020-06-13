import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {

  String nome;
  Cliente(this.nome);

  @override
  _ClienteState createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Cliente ${widget.nome}"),
      ),
    );
  }
}
