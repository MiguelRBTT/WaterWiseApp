import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Tela inicial',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Icon(Icons.home,
          color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF40FFDC), // Cor hexadecimal #1C3166
              Color(0xFF00A9D4), // Cor hexadecimal #240047
              Color(0xFF1C3166), // Cor hexadecimal #1C0021
            ],
          )
        ),
          ),

    );
  }
}
