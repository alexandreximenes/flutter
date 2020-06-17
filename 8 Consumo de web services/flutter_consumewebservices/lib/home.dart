import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Cep{

  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;

//  Cep(this.cep, this.localidade, this.complemento, this.bairro, this.localidade, this.uf, this.unidade, this.ibge);

  @override
  String toString() {
    return "Cep: ${cep} \nlogradouro: ${logradouro} \ncomplemento: ${complemento} \nbairro: ${bairro} \nlocalidade: ${localidade} \nuf:${uf} \nunidade: ${unidade} \nibge: ${ibge}";
  }

}

class _HomeState extends State<Home> {

  TextEditingController _editingController = TextEditingController();
  String _text = "";

  _recuperarEndereco(String cep) async{
    String urlWs = "https://viacep.com.br/ws/${cep}/json/";
    http.Response response = await http.get(urlWs);
    print("Response: ${response.body}");

    Map<String, dynamic> retorno = new Map();
    retorno = json.decode(response.body);

    Cep _cep = new Cep();
    _cep.cep = retorno["cep"];
    _cep.logradouro = retorno["logradouro"];
    _cep.complemento = retorno["complemento"];
    _cep.bairro = retorno["bairro"];
    _cep.localidade = retorno["localidade"];
    _cep.uf = retorno["uf"];
    _cep.unidade = retorno["unidade"];
    _cep.ibge = retorno["ibge"];

    setState(() {
      _text = _cep.toString();
      print(_text);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Via cep",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffffffff), backgroundColor: Color(0xff00cc00)),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _editingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Informe um cep",
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                RaisedButton(
                  child: Text(
                    "Buscar cep",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                  color: Color(0xff00cc00),
                  onPressed: () {
                    _recuperarEndereco(_editingController.text);
                  },
                ),
                Text(
                  "$_text",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
