import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  String _infoIdeal = "INFO IDEAL";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
      _infoIdeal = "INFO IDEAL";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      _infoText = "IMC = ${imc.toStringAsPrecision(3)}";
      if (imc < 18.6) {
        _infoText += "\nAbaixo do Peso";
      } else if (imc < 24.9) {
        _infoText += "\nPeso Ideal";
      } else if (imc < 29.9) {
        _infoText += "\nLevemente Acima do Peso";
      } else if (imc < 34.9) {
        _infoText += "\nObesidade Grau I";
      } else if (imc < 39.9) {
        _infoText += "\nObesidade Grau II";
      } else {
        _infoText += "\nObesidade Grau III";
      }

      double weightIdeal = 0;

      if (imc < 18.6) {
        weightIdeal = 18.6 * height * height;
      } else {
        weightIdeal = 24.9 * height * height;
      }
      _infoIdeal = "Peso Ideal: ${weightIdeal.toStringAsPrecision(3)} kg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person, size: 120, color: Colors.green),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu Peso!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (cm)",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua Altura!";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: Text(
                      "$_infoText",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                    ),
                  ),
                  Text(
                    "$_infoIdeal",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  )
                ],
              ),
            )));
  }
}
