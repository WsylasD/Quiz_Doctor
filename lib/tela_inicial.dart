import 'package:flutter/material.dart';
import 'tela_quiz_1.dart';
import 'tela_quiz_2.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Doctor Quiz'),
        backgroundColor: const Color.fromARGB(255, 51, 38, 236),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 570,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(60, 58, 192, 0.808),
                  width: 3,
                ),
              ),
              child: Image.asset(
                'lib/assets/the_doctors.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Espaçamento entre botões
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaQuiz1()),
                    );
                  },
                  child: const Text('Quiz 1 - Normal'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaQuiz2()),
                    );
                  },
                  child: const Text('Quiz 2 - Dificil'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
