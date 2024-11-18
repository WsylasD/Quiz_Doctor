import 'package:flutter/material.dart';
import 'tela_quiz_1.dart';
import 'tela_quiz_2.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/assets/tardis_icon.png'),
          ),
          title: const Text('Doctor Quiz'),
          backgroundColor: const Color.fromARGB(255, 51, 38, 236),
        ),
        body: Container(
          // Background
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 350,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:
                            AssetImage('lib/assets/background_questions.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.blue.shade900, width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Bem Vindo ao Quiz sobre DOCTOR WHO',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 5),
                Container(
                  height: 45,
                  width: 300,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image:
                          AssetImage('lib/assets/background_questions.jpg'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.blue.shade900, width: 2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'ESCOLHA UM QUIZ ABAIXO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Espaçamento entre botões
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
                      child: const Text('Quiz 2 - Dificil (Timer)'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
