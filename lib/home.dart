import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Tela inicial',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Icon(Icons.home, color: Colors.white),
        ),
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 125, 25, 20),
              child: Image(
                image: AssetImage('assets/logo_oficial.png'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Corrigindo a rota para a rota existente: '/calculator'
                Navigator.pushNamed(context, '/calculator');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 75),
                backgroundColor: Colors.transparent,
                elevation: 0,
                side: const BorderSide(width: 3, color: Color(0xFF00A9D4)),
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
