import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();
bool boasVindas = true;

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

_speak(String _letra) async{

  print("letra: $_letra");

  await flutterTts.setLanguage("pt-BR");
  await flutterTts.setPitch(1.0);

  await flutterTts.speak("essa é a letra $_letra");
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
  List<String> _letras = [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ];

  @override
  Widget build(BuildContext context) {

    _boasVindas();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Letras aleatórias",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 10,
              color: Colors.amberAccent,
              style: BorderStyle.solid
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/alphabet.png", fit: BoxFit.fill,),
              Column(
                children: <Widget>[
                  Text(_letra, style: TextStyle(
                    color: Colors.grey,
                    fontSize: 220,
                    fontWeight: FontWeight.bold
                  ),)
                ],)
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text(
                  "Trocar de letra",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            onPressed: () => {
              _gerarLetraAleatorio(),
              _speak(_letra)
            },
          ),
        ),
      );

  }

  Future _gerarLetraAleatorio() {
    _numero = Random().nextInt(_letras.length);
    print(_letra);
    setState(() {
      _letra = _letras[_numero];
    });
  }
}

