import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Em Desenvolvimento'),
      ),
      body: Container(
        child: Center(
          child: Text(
              'Página está sendo construída no momento, versão web: Pré-alpha v.0.1.9'),
        ),
      ),
    );
  }
}
