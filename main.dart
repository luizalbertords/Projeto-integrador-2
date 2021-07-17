import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main(List<String> args) {
  runApp(Calculadora());
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String resultadofinal = '';
  double resultado = 0.0;
  String valor2 = '';
  String valor1 = '';
  String operador = '';

  void calcular() {
    setState(() {
      
      double numero1 = double.parse(valor1.toString());
      double numero2 = double.parse(valor2.toString());
      if (operador == '+') {
        resultado = numero1 + numero2;
        resultadofinal = resultado.toString();
      } else if (operador == '-') {
        resultado = numero1 - numero2;
        resultadofinal = resultado.toString();
      } else if (operador == '/') {
        resultado = numero1 / numero2;
        resultadofinal = resultado.toString();
      } else {
        resultado = numero1 * numero2;
        resultadofinal = resultado.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      home: Scaffold(
        //tela
        appBar: AppBar(
          //title
          title: Center(
            child: Text(
              'Calculadora Simples',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Calcule facil',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Informe numeros',
                  labelText: 'Informe o Primeiro valor',
                  labelStyle: TextStyle(color: Colors.red, fontSize: 25),
                  
                ),
                onChanged: (valor) {
                  valor1 = valor.replaceAll(',', '.');
                  //.replaceAll transforma um item em outro
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Informe numeros',
                  labelText: 'Informe o segundo valor',
                  labelStyle: TextStyle(color: Colors.red, fontSize: 25),
                ),
                onChanged: (valor) {
                  valor2 = valor.replaceAll(',', '.');
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.red, fontSize: 25),
                  hintText: 'Informe numeros',
                  labelText: 'Operador',
                ),
                onChanged: (valor) {
                  operador = valor;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: calcular,
                  child: Text('CALCULAR',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      )),
                ),
              ),
              Center(
                  child: Text(
                'Seu resultado é:',
              )),
              Text('$resultadofinal')
            ],
          ),
        ),
      ),
    );
  }
}
