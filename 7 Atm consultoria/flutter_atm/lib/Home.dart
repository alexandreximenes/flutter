import 'package:flutter/material.dart';
import 'package:flutteratm/cliente.dart';
import 'package:flutteratm/contato.dart';
import 'package:flutteratm/empresa.dart';
import 'package:flutteratm/servico.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _navigator(dynamic clazz) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => clazz));
  }

  _abrirEmpresa() {
    _navigator(Empresa());
  }

  _abrirServico() {
    _navigator(Servico());
  }

  _abrirCliente(String nome) {
    _navigator(Cliente(nome));
  }

  _abrirContato() {
    _navigator(Contato());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ATM Consultoria"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Image.asset("images/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _abrirEmpresa(),
                        child: Image.asset("images/menu_empresa.png"),
                      ),
                      GestureDetector(
                        onTap: () => _abrirServico(),
                        child: Image.asset("images/menu_servico.png"),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _abrirCliente("Alexandre"),
                        child: Image.asset("images/menu_cliente.png"),
                      ),
                      GestureDetector(
                        onTap: () => _abrirContato(),
                        child: Image.asset("images/menu_contato.png"),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
 