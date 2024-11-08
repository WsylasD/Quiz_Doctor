import 'package:flutter/material.dart';
import 'tela_quiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo ao Quiz Doctor'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaQuiz()),
            );
          },
          child: Text('Começar Quiz'),
        ),
      ),
    );
  }
}
