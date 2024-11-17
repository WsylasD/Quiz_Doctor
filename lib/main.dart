import 'package:flutter/material.dart';
import 'tela_inicial.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App Quiz',
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: TelaInicial(), 
    );
  }
}
