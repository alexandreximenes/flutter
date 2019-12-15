import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mudar de frase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numero_aleatorio = 0;
  List _frases = [
  'Tente mover o mundo – o primeiro passo será mover a si mesmo.',
  'O medo de perder, tira a vontade de ganhar',
  'O que você quer receber do outro, faça primeiro á ele',
  'O homem superior atribui a culpa a si próprio; o homem comum, aos outros.'
  ];

  void _incrementCounter() {
    setState(() {
      _numero_aleatorio = Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aperte o botão para visualizar uma nova frase',
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  _frases[_numero_aleatorio],
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
