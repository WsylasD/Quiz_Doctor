import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  TelaResultado({required this.totalScore, required this.resetQuiz});

  String get resultPhrase {
    if (totalScore == 5) {
      return 'Parabéns! Você acertou todas!';
    } else if (totalScore == 3) {
      return 'Bom trabalho!';
    } else {
      return 'Precisa de mais prática.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Quiz'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/11-doctor.jpg'),
            SizedBox(height: 20),
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                resetQuiz();
                Navigator.pop(context); // Tela Inicial
              },
              child: Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
