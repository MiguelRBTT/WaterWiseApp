import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: Color(0xFF40FFDC),
          ),
        ),
        title: Text(
          'Calculadora de Água',
          style: TextStyle(color: Color(0xFF40FFDC)),
        ),
        backgroundColor: Color(0xFF1C3166),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00A9D4),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WaterCalculatorPage()),
              );
            },
            child: Text('Calcular consumo de água'),
          ),
        ),
      ),
    );
  }
}

class WaterCalculatorPage extends StatefulWidget {
  @override
  _WaterCalculatorPageState createState() => _WaterCalculatorPageState();
}

class _WaterCalculatorPageState extends State<WaterCalculatorPage> {
  final _weightController = TextEditingController();
  String _result = '';

  void _calculateWaterIntake() {
    final weight = double.tryParse(_weightController.text);
    if (weight != null) {
      final minWater = (weight * 35) / 1000; // em litros
      final maxWater = (weight * 50) / 1000; // em litros
      setState(() {
        _result =
            'Você deve beber entre ${minWater.toStringAsFixed(2)} e ${maxWater.toStringAsFixed(2)} litros de água por dia.';
      });
    } else {
      setState(() {
        _result = 'Por favor, insira um peso válido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Água'),
        backgroundColor: Color(0xFF1C3166),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira seu peso (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFF00A9D4), // Botão com a cor principal do tema
              ),
              onPressed: _calculateWaterIntake,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF1C3166),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF40FFDC),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
