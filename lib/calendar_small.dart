import 'package:flutter/material.dart';

class CalendarSmall extends StatefulWidget {
  const CalendarSmall({super.key});

  @override
  State<CalendarSmall> createState() => _CalendarSmallState();
}

class _CalendarSmallState extends State<CalendarSmall> {
  final daysH = 70.0;

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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Dom',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Seg',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Ter',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Qua',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Qui',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Sex',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Column(
                      children: [
                        const Text('Sáb',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                              width: 10,
                              height: daysH,
                              color: Colors.white,
                              child: Image.asset('assets/waves.jpg',
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
