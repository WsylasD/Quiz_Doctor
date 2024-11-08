import 'package:flutter/material.dart';
import 'tela_inicial.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App de Quiz',
      theme: ThemeData(primarySwatch: Colors.amber), 
      home: TelaInicial(), 
    );
  }
}
