import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _editingControllerAlcool = TextEditingController();
  TextEditingController _editingControllerGasolina = TextEditingController();
  String _resultado = "";
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "App Alcool ou Gasolina",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Image.asset("images/logo.png"),
                ),
                Text(
                  "Saiba qual a melhor opção para abastecimento do seu veiculo",
                  style: TextStyle(color: Colors.blue),
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Informe o preço do Alcool",
                    labelStyle: TextStyle(color: Colors.indigo, fontSize: 20),
                    helperText: this._editingControllerAlcool.text.length > 0
                        ? "Informe um preço para o alcool"
                        : "",
                    hintText: "Ex: 2.49",
                    suffixIcon: Icon(Icons.mail_outline),
                  ),
                  maxLength: 6,
                  maxLengthEnforced: false,
                  style: TextStyle(color: Colors.indigo, fontSize: 20),
                  controller: _editingControllerAlcool,
                  focusNode: focusNode,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Inform o preço da Gasolina",
                    labelStyle: TextStyle(color: Colors.indigo, fontSize: 20),
                    helperText: this._editingControllerGasolina.text.length > 0
                        ? "Informe um preço para a gasolina"
                        : "",
                    hintText: "Ex: 3.49",
                    suffixIcon: Icon(Icons.enhanced_encryption),
                  ),
                  maxLength: 6,
                  //obscureText: true,
                  maxLengthEnforced: false,
                  style: TextStyle(color: Colors.indigo, fontSize: 20),
                  onSubmitted: (String t) {
                    print("onSubmitted: $t");
                  },
                  controller: _editingControllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    _resultado,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      _calcular();
                    },
                  ),
                ),

              ],
            ),
          ),
        ));
  }

  void _calcular() {
    _resultado = "";
    double precoAlcool = double.tryParse(_editingControllerAlcool.text.replaceAll(",", "."));
    double precoGasolina = double.tryParse( _editingControllerGasolina.text.replaceAll(",", "."));

    print("Alcool: $precoAlcool");
    print("Gasolina: $precoGasolina ");

    if(precoAlcool != null && precoAlcool > 0 && precoGasolina != null && precoGasolina > 0){

      double _resultadoCalculo = (precoAlcool / precoGasolina);
      print("Resultado calculo: $_resultadoCalculo ");

      if( _resultadoCalculo <= 0.7){
        setState(() {
          _resultado = "Alcool: $precoAlcool \nGasolina: $precoGasolina \nMelhor abastecer com Alcool";
        });
      }else{
        setState(() {
          _resultado = "Alcool: $precoAlcool \nGasolina: $precoGasolina\nMelhor abastecer com Gasolina";
        });
      }
      print(_resultado);
      _limparCampos();
    }
  }
  
  _limparCampos(){
    _editingControllerAlcool.clear();
    _editingControllerGasolina.clear();
  }
}
