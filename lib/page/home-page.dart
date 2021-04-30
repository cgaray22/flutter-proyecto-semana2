import 'package:flutter/material.dart';
import 'package:imc/page/resultados.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter_peso = 0;

  String  _genero = "";

  void _incrementCounterPeso() {
    setState(() {
      _counter_peso++;
    });
  }

  void _decrementCounterPeso() {
    setState(() {
      if (_counter_peso > 1) {
        _counter_peso--;
      }
    });
  }

  int _counter_edad = 0;

  void _incrementCounterEdad() {
    setState(() {
      _counter_edad++;
    });
  }

  void _decrementCounterEdad() {
    setState(() {
      if (_counter_edad > 1) {
        _counter_edad--;
      }
    });
  }

  double estatura = 166;

  String imc = "";
  String mensaje = "";
  String categoria = "";

  void CalcularIMC() { 
      double rtaAltura = (estatura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double resultado = _counter_peso / alturapordos;    

      if(resultado<18.5){
         setState(() {
          categoria = "Bajo Peso";
          mensaje = "Cuidate estas bajo de peso";
        });
      }
      if(resultado >= 18.5 && resultado <= 24.9){
         setState(() {
          categoria = "Peso Normal";
          mensaje = "Tiene un peso corporal normal ¡buen trabajo!";
        });
      }
      if(resultado >= 25 && resultado <= 29.9){
         setState(() {
          categoria = "Sobrepeso";
          mensaje = "Cuidate estas en sobrepeso";
        });
      }
      if(resultado >= 30 && resultado <= 34.5){
         setState(() {
          categoria = "Obesidad grado I";
          mensaje = "Cuidate, debes hacer ejecicio";
        });
      }
      if(resultado >= 35 && resultado <= 39.9){
         setState(() {
          categoria = "Obesidad grado II";
          mensaje = "Cuidate, Obesidad grado II";
        });
      }
      if(resultado >= 40){
         setState(() {
          categoria = "Obesidad grado III";
          mensaje = "Cuidate, obesidad grado III";
        });
      }

      setState(() {
        imc = "$resultado";
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

    Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF212122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _genero = "m";
                                  });
                                },     
                               // color: Colors.pinkAccent,
                                padding: EdgeInsets.all(40.0),
                                child: Column(
                                  children: <Widget>[
                                    new Tab(
                                      icon: new Image.asset("assets/images/male.png",
                                      height: 40),
                                      text: "Hombre")
                                  ],
                                ),
                              )),
                          ])
                    ])),
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF212122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _genero = "f";
                                  });
                                },                              
                                padding: EdgeInsets.all(40.0),
                                child: Column(
                                  children: <Widget>[
                                    new Tab(
                                      icon: new Image.asset("assets/images/female.png",
                                      height: 40),
                                      text: "Mujer")
                                  ],
                                ),
                              )),
                          ])
                    ])),
            
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF212122),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 160,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Estatura",
                                style: TextStyle(
                                    color: Colors.white30, fontSize: 20),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                estatura.round().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 50),
                              ),
                              Text(" cm",
                                  style: TextStyle(
                                      color: Colors.white30, fontSize: 20))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SliderTheme(
                                data: SliderThemeData(
                                    activeTrackColor: Colors.white,
                                    thumbColor: Colors.pink,
                                    overlayColor: Colors.pink.withOpacity(0.2),
                                    inactiveTrackColor: Colors.white24,
                                    valueIndicatorColor: Colors.pink),
                                child: Slider(
                                  value: estatura,
                                  min: 10,
                                  max: 220,
                                  divisions: 100,
                                  label:
                                      estatura.round().toString() +
                                          " cm",
                                  onChanged: (double value) {
                                    setState(() {
                                      estatura = value;
                                    });
                                  },
                                ),
                              )
                            ])
                      ]))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF212122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Peso",
                              style: TextStyle(
                                  color: Colors.white30, fontSize: 20),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "$_counter_peso",                              
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _decrementCounterPeso,
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 32),
                            ),
                            FloatingActionButton(
                              onPressed: _incrementCounterPeso,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            )
                          ])
                    ])),
            Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF212122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Edad",
                              style: TextStyle(
                                  color: Colors.white30, fontSize: 20),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "$_counter_edad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: _decrementCounterEdad,
                              child: Icon(Icons.remove,
                                  color: Colors.white, size: 32),
                            ),
                            FloatingActionButton(
                              onPressed: _incrementCounterEdad,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 32),
                            )
                          ])
                    ])),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
              height: 80,
              color: Colors.pink,
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: FlatButton(
                        onPressed: CalcularIMC,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(0.0)),
                          color: Colors.pink,
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[Text('Calcular')],
                          ),
                      ),
                )]),
              ])),
        ),
        Container(                    
          child: Text(
            imc,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          
        ), 
        Container(                    
          child: Text(
            categoria,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          
        ),
        Container(                    
          child: Text(
            mensaje,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          
        ),   
      ],
   
    );
  }
}