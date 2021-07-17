import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main(List<String> args) {
  runApp(CalculadoraCombustivel());
}

class CalculadoraCombustivel extends StatefulWidget {
  @override
  _CalculadoraCombustivelState createState() => _CalculadoraCombustivelState();
}

class _CalculadoraCombustivelState extends State<CalculadoraCombustivel> {
  String melhorCombustivel = '';

  double resultado = 0.0;

  String etanol = '';

  String gasolina = '';

  void calcularcombustivel() {
    setState(() {
      double valorGasolina = double.parse(gasolina.toString());
      double valorEtanol = double.parse(etanol.toString());
      resultado = valorEtanol / valorGasolina;
      if (resultado < 0.7) {
        melhorCombustivel = 'Etanol';
      } else if (resultado >= 0.7) {
        melhorCombustivel = 'Gasolina';
      } else {
        melhorCombustivel = 'Erro ao calcular';
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
          title: Center(child: Text('Calculadora de Combustivel:.')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Center(child: Text('Bora Economizar')),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Informe numeros',
                  icon: Icon(Icons.local_gas_station),
                  labelText: 'Informe o Preço da Gasolina',
                ),
                onChanged: (valor) {
                  gasolina = valor.replaceAll(',', '.');
                  //.replaceAll transforma um item em outro
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Informe numeros',
                  icon: Icon(Icons.local_gas_station),
                  labelText: 'Informe o Preço do Alcool',
                ),
                onChanged: (valor) {
                  etanol = valor.replaceAll(',', '.');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: calcularcombustivel,
                  child: Text('calcular'),
                ),
              ),
              Center(child: Text('Melhor Combustivel:')),
              Text('$melhorCombustivel')
            ],
          ),
        ),
      ),
    );
  }
}
