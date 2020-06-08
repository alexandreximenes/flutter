import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';

import 'LetraA.dart';
import 'LetraB.dart';

final FlutterTts flutterTts = FlutterTts();
bool boasVindas = true;

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

_speak(String _letra) async {
  print("letra: $_letra");

  await flutterTts.setLanguage("pt-BR");
  await flutterTts.setPitch(1.0);

  await flutterTts.speak("$_letra");
  print(flutterTts.getLanguages);
  print(flutterTts.getVoices);

  /*flutterTts.setSpeechRate(1.0);
    flutterTts.setVolume(1.0);
    flutterTts.isLanguageAvailable("pt-BR");
    // iOS only
    flutterTts.setSharedInstance(true);
    flutterTts.pause();
    // Android only
    flutterTts.synthesizeToFile(_letra, "tts.wav");
    flutterTts.setSilence(2);*/
}

void _boasVindas() {
  if (boasVindas) {
    boasVindas = false;
    flutterTts.speak("Oi Amandinha e Arthur, vamos aprender o alfabeto ? ");
  }
}

class _HomeState extends State<Home> {
  String _letra = "A";
  int _numero = 1;
  int _numeroAZ = 0;
  List<String> _letras = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  final _palavrasLetraA = LetraA.getPalavras;
  final _palavrasLetraB = LetraB.getPalavras;
  String _palavra = "";

  @override
  Widget build(BuildContext context) {
    _boasVindas();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Letras do alfabeto",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          border: Border.all(
              width: 20, color: Colors.cyan, style: BorderStyle.solid),
        ),
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                      child: GestureDetector(
                    onTap: () => {
                      _palavra = _palavraComALetra(_letra),
                      _speak("$_letra de $_palavra")
                    },
                    child: Text(
                      _letra,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 300,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.autorenew),
                    color: Colors.purple,
                    autofocus: true,
                    iconSize: 50,
                    tooltip: 'Aleatorio',
                    onPressed: () => {
                      _gerarLetraAleatorio(),
                      _speak("essa é a letra $_letra"),
                    },
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.sort_by_alpha),
                    color: Colors.purple,
                    autofocus: true,
                    iconSize: 50,
                    tooltip: 'Play',
                    onPressed: () => {
                      _letraAZ(),
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future _gerarLetraAleatorio() {
    _numero = Random().nextInt(_letras.length);
    print(_letra);
    setState(() {
      _letra = _letras[_numero];
    });
  }

  void _letraAZ() {
    _speak("essa é a letra " +_letras[_numeroAZ]);
    setState(() {
      if (_numeroAZ < _letras.length) {
        _letra = _letras[_numeroAZ];
      }
      if (_numeroAZ == _letras.length) {
        _numeroAZ = 0;
      } else {
        _numeroAZ++;
      }

    });
  }

  String _palavraComALetra(String letra) {
//    sleep(new Duration(seconds:2));
    _numero = Random().nextInt(_palavrasLetraA.length);

    switch (letra) {
      case "A":
        return _palavrasLetraA[_numero];
        break;
      case "B":
        return _palavrasLetraB[_numero];
        break;
      case "C":
      case "D":
      case "E":
      case "F":
      case "G":
      case "H":
      case "I":
      case "J":
      case "K":
      case "L":
      case "M":
      case "N":
      case "O":
      case "P":
      case "R":
      case "S":
      case "T":
      case "U":
      case "V":
      case "W":
      case "X":
      case "Y":
      case "Z":
    }
    ;
  }
}
