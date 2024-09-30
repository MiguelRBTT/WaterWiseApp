import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'calculator.dart';

class CalendarSmall extends StatelessWidget {
  const CalendarSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text(
            'WaterWise',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent),
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
        child: Column(
          children: [
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CalendarioRandomizado(),
            ),
            const SizedBox(height: 30),
            TorneiraCopo()
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final angle = 30.0;
  final slimeter = 25.0;

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(angle, 0)
      ..quadraticBezierTo(0, 0, 0, angle)
      ..lineTo(slimeter, size.height - angle)
      ..quadraticBezierTo(slimeter, size.height, angle * 2, size.height)
      ..lineTo(size.width - angle * 2, size.height)
      ..quadraticBezierTo(size.width - slimeter, size.height,
          size.width - slimeter, size.height - angle)
      ..lineTo(size.width, angle)
      ..quadraticBezierTo(size.width, 0, size.width - angle, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TorneiraCopo extends StatefulWidget {
  const TorneiraCopo({super.key});

  @override
  State<TorneiraCopo> createState() => _TorneiraCopoState();
}

class _TorneiraCopoState extends State<TorneiraCopo> {
  int ml = 0;
  Timer? _timer;

  void _increaseWaterLevel() {
    setState(() {
      ml += 10;
    });
  }

  void _startIncreasing() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      _increaseWaterLevel();
    });
  }

  void _stopIncreasing() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTapDown: (_) => _startIncreasing(),
          onTapUp: (_) => _stopIncreasing(),
          child: Container(
            color: HexColor('#1c3166'),
            width: 30,
            height: 90,
          ),
        ),
        const SizedBox(height: 50),
        Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                  height: 300,
                  width: 250,
                  color: Colors.white,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: (ml / qtd_drink!.toInt()) * 300,
                        width: double.infinity,
                        color: HexColor('00A9D4'),
                      ),
                    ],
                  ))),
            ),
            Text('$ml ml',
                style: TextStyle(
                    color: HexColor('#40ffdc'),
                    fontWeight: FontWeight.bold,
                    fontSize: 40))
          ],
        ),
        // ),
      ],
    );
  }
}

class CalendarioRandomizado extends StatelessWidget {
  const CalendarioRandomizado({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, int> consumoDaSemana = _gerarConsumoDiario(qtd_drink!.toInt());

    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: HexColor('#00a9d4'), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (String dia in ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'])
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    dia,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        width: 10,
                        height: (consumoDaSemana[dia] ?? 0) /
                            qtd_drink!.toInt() *
                            100,
                        color: HexColor('#1c3166')),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Map<String, int> _gerarConsumoDiario(int metaDiaria) {
    Random random = Random();
    Map<String, int> consumoDaSemana = {};
    List<String> dias = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];

    for (String dia in dias) {
// Gera um valor aleatório para cada dia, garantindo que a soma não ultrapasse a meta
      int consumo =
          random.nextInt(metaDiaria ~/ 1.5); // Gera até metade da meta diária
      consumoDaSemana[dia] = consumo;
    }

    return consumoDaSemana;
  }
}
