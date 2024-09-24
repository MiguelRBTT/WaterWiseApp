import 'dart:async'; // Import necessário para usar o Timer

import 'package:flutter/material.dart';

class CalendarSmall extends StatefulWidget {
  const CalendarSmall({super.key});

  @override
  State<CalendarSmall> createState() => _CalendarSmallState();
}

class _CalendarSmallState extends State<CalendarSmall> {
  final daysH = 70.0;
  double waterLevel = 0; // Nível de água
  bool isPlugged = true; // Variável para saber se o tampão está no lugar
  Timer? _timer; // Timer para controlar o incremento e decremento contínuo

  // Função para começar a aumentar o nível de água
  void _startIncreasingWaterLevel() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        waterLevel += 10;
        if (waterLevel > 1000) waterLevel = 1000; // Limite máximo da água
      });
    });
  }

  // Função para parar de aumentar o nível de água
  void _stopIncreasingWaterLevel() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  // Função para começar a diminuir o nível de água (escoamento)
  void _startDecreasingWaterLevel() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        waterLevel -= 10;
        if (waterLevel < 0) waterLevel = 0; // Limite mínimo da água
      });
    });
  }

  // Função para parar de escoar a água
  void _stopDecreasingWaterLevel() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  // Função chamada quando o tampão é arrastado
  void _onDragPlug(DragEndDetails details) {
    setState(() {
      isPlugged = !isPlugged; // Alterna entre tampão no lugar ou fora
      if (isPlugged) {
        _stopDecreasingWaterLevel();
      } else {
        _startDecreasingWaterLevel(); // Começa a escoar quando o tampão é removido
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WaterWise')),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDayColumn('Dom'),
                  _buildDayColumn('Seg'),
                  _buildDayColumn('Ter'),
                  _buildDayColumn('Qua'),
                  _buildDayColumn('Qui'),
                  _buildDayColumn('Sex'),
                  _buildDayColumn('Sáb'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTapDown: (_) => _startIncreasingWaterLevel(),
            onTapUp: (_) => _stopIncreasingWaterLevel(),
            onTapCancel: _stopIncreasingWaterLevel,
            child: Container(color: Colors.grey, width: 30, height: 30),
          ),
          Container(color: Colors.brown, width: 30, height: 60),
          const SizedBox(height: 50),
          Stack(
            children: [
              CustomPaint(
                size: const Size(200, 340),
                painter: GlassOutlinePainter(waterLevel, isPlugged),
              ),
              Positioned(
                bottom: 200,
                left: 64,
                child: Text(
                  '${waterLevel.toStringAsFixed(0)}ml',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              Positioned(
                bottom: 12, // Coloca o tampão na base do copo
                left: 80,
                child: GestureDetector(
                  onTapDown: (_) => _startDecreasingWaterLevel(),
                  onTapUp: (_) => _stopDecreasingWaterLevel(),
                  onTapCancel: _stopDecreasingWaterLevel,
                  // Detecta arrasto do tampão
                  child: Container(
                    width: 40,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isPlugged ? Colors.grey : Colors.grey,
                      // Cor muda conforme tampão
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayColumn(String day) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        children: [
          Text(day,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
                width: 10,
                height: daysH,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset('assets/waves.jpg', fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

class GlassOutlinePainter extends CustomPainter {
  final double waterLevel;
  final bool isPlugged;

  GlassOutlinePainter(this.waterLevel, this.isPlugged);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path = Path();

    // Contorno do copo com bordas arredondadas
    path.moveTo(size.width * 0.1, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.02,
        size.width * 0.9, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.3,
        size.width * 0.75, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width * 0.25, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.05, size.height * 0.3,
        size.width * 0.1, size.height * 0.1);
    path.close();

    canvas.drawPath(path, paint);

    // Desenho da água
    final waterPaint = Paint()
      ..color = Colors.blue.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.clipPath(path);

    double waterHeight = (waterLevel / 1000) * size.height;

    canvas.drawRect(
      Rect.fromLTWH(0, size.height - waterHeight, size.width, waterHeight),
      waterPaint,
    );

    canvas.restore();

    // Desenho do ralo
    final drainPaint = Paint()..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.95), 10, drainPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
