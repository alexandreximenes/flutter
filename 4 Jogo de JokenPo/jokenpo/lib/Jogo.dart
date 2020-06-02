import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _standardImage = AssetImage("images/padrao.png");
  String _mensagem = "Resultado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JokenPo"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            //imagem
            Image(image: _standardImage,),
            //texto res
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    height: 100,
                    child: GestureDetector(
                      onTap: () => _onTap("papel"),
                      child: Image.asset("images/papel.png"),
                    )
                ),
                SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () => _onTap("pedra"),
                    child: Image.asset("images/pedra.png"),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () => _onTap("tesoura"),
                    child: Image.asset("images/tesoura.png"),
                  ),
                ),
              ],
            ),
            //Row 3 imagens
          ],
        ));
  }

  _onTap(String escolhaUser) {
    List<String> opcoes = ["pedra", "papel", "tesoura"];
    int numero = Random().nextInt(opcoes.length);
    String escolhaApp = opcoes[numero];

    print("Escolha do app $escolhaApp");
    print("Escolha do user: $escolhaUser");

    switch (escolhaApp) {
      case "papel":
        setState(() {
          this._standardImage = AssetImage("images/papel.png");
        });
        break;
      case "pedra":
        setState(() {
          this._standardImage = AssetImage("images/pedra.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._standardImage = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (
    (escolhaUser == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUser == "tesoura" && escolhaApp == "papel") ||
        (escolhaUser == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Resultado: Parabens, você ganhou";
      });
    } else if (
    (escolhaApp == "pedra" && escolhaUser == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUser == "papel") ||
        (escolhaApp == "papel" && escolhaUser == "pedra")) {

      setState(() {
        this._mensagem = "Resultado: Você perdeu";
      });

    }else{
      setState(() {
        this._mensagem = "Resultado: empatamos";
      });

    }
  }
  }
