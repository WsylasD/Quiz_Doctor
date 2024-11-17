import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  TelaResultado({required this.totalScore, required this.resetQuiz});

  String get resultPhrase {
    if (totalScore == 5) {
      return 'PARABÉNS! VOCÊ ACERTOU TODAS AS PERGUNTAS!';
    } else if (totalScore >= 3) {
      return 'BOM TRABALHO!';
    } else {
      return 'PRECISA DE MAIS PRATICA';
    }
  }

  String _getResultImage() {
  if (totalScore == 5) {
    return 'lib/assets/doctor_5_points.jpg'; 
  } else if (totalScore >= 3) {
    return 'lib/assets/doctor_3_points.jpg'; 
  } else {
    return 'lib/assets/doctor_0_points.jpg'; 
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do Quiz'),
        backgroundColor: const Color.fromARGB(255, 51, 38, 236),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 27, 31, 216),
                  width: 3,
                ),
              ),
              child: Image.asset(
                _getResultImage(), // imagem de acordo com o resultado
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.blue.shade900, width: 2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Text(
                resultPhrase,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue,
              ),
              child: Text(
                totalScore.toString(),
                style: const TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                resetQuiz();
                Navigator.pop(context);
              },
              child: const Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
