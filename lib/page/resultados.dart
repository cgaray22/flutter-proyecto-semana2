import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final int counter_edad, counter_peso;
  final double estatura;
  final String genero;
  String _categoria = "", _mensaje = "", _imc = ""; 
  Color color = Colors.white;

  ResultadoPage(
      {required this.counter_edad,
      required this.counter_peso,
      required this.estatura,
      required this.genero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    calcularIMC();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Text(
            "Resultado",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[800],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    _categoria,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ),
                Center(
                  child: Text(
                    _imc,
                    style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    _mensaje,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 90,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
  void calcularIMC() { 
      double rtaAltura = (estatura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double resultado = counter_peso / alturapordos; 
      resultado = double.parse(resultado.toStringAsFixed(1));     

      _imc = "$resultado"; 

      if(resultado<18.5){
        _categoria = "Bajo Peso";
        _mensaje = "Cuidate estas bajo de peso";        
      }
      if(resultado >= 18.5 && resultado <= 24.9){
        _categoria = "Peso Normal";
        _mensaje = "Tiene un peso corporal normal ¡buen trabajo!";        
      }
      if(resultado >= 25 && resultado <= 29.9){
        _categoria = "Sobrepeso";
        _mensaje = "Cuidate estas en sobrepeso";
      }
      if(resultado >= 30 && resultado <= 34.5){
        _categoria = "Obesidad grado I";
        _mensaje = "Cuidate, debes hacer ejecicio";
      }
      if(resultado >= 35 && resultado <= 39.9){
        _categoria = "Obesidad grado II";
        _mensaje = "Cuidate, Obesidad grado II";
      }
      if(resultado >= 40){
        _categoria = "Obesidad grado III";
        _mensaje = "Cuidate, obesidad grado III";
      }      
  }
}