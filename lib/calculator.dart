import 'package:flutter/material.dart';

double? qtd_drink = 0;

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _weightController = TextEditingController();
  String _result = '';
  // Variável que irá armazenar a quantidade de água a ser bebida

  void _calculateWaterIntake() {
    final weight = double.tryParse(_weightController.text);
    if (weight != null && weight > 0) {
      qtd_drink = weight * 35; // Cálculo: 35 ml de água por kg de peso
      setState(() {
        _result =
            'Você deve beber ${qtd_drink!.toStringAsFixed(0)} ml de água por dia';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Calculadora de Água',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF40FFDC),
              Color(0xFF00A9D4),
              Color(0xFF1C3166),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Campo para inserir o peso
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Qual é o seu peso?',
                    labelStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white24,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Botão para calcular
                ElevatedButton(
                  onPressed: _calculateWaterIntake,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A9D4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                // Exibição do resultado
                Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                // Botão para ir para a página do calendário
                ElevatedButton(
                  onPressed: () {
                    if (qtd_drink != null) {
                      // Navegar para a rota do calendário, passando qtd_drink como argumento
                      Navigator.pushNamed(
                        context,
                        '/calendar',
                        arguments: qtd_drink, // Passar qtd_drink como argumento
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Primeiro faça o cálculo.'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A9D4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Próxima Página',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
