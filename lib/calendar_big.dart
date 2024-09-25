import 'package:flutter/material.dart';

class CalendarBig extends StatefulWidget {
  const CalendarBig({super.key});

  @override
  State<CalendarBig> createState() => _CalendarBigState();
}

class _CalendarBigState extends State<CalendarBig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          width: 350,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GridView.count(
            crossAxisCount: 7,
            children: List.generate(30, (index) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                color: Colors.white) ,
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: Text('$index'),
                ),
              );


        })
        )
        ),
      ),
    );
  }
}
