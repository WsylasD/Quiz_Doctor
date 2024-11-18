import 'dart:async';
import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class TelaQuiz1 extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz1> {
  final _questions = [
    {
      'questionText': 'Qual a melhor serie de televisão Britanica?',
      'image': 'lib/assets/doctor_looking_outside.jpg',
      'answers': [
        {'text': 'Friends', 'score': 0},
        {'text': 'The big Bang Theory', 'score': 0},
        {'text': 'Doctor Who', 'score': 1},
        {'text': 'Doctor House', 'score': 0},
      ],
    },
    {
      'questionText': 'Quem é o Doutor?',
      'image': 'lib/assets/best_doctors.jpg',
      'answers': [
        {'text': 'Dr. Shaun Murphy', 'score': 0},
        {'text': 'Dr. House', 'score': 0},
        {'text': 'Doutor Quem?', 'score': 1},
        {'text': 'Hipócrates de Cós', 'score': 0},
      ],
    },
    {
      'questionText': 'Quem é o maior inimigo do Doutor?',
      'image': 'lib/assets/enemies_doctor.jpg',
      'answers': [
        {'text': 'Uma Maçã', 'score': 0},
        {'text': 'Daleks', 'score': 1},
        {'text': 'Andrew Wakefield', 'score': 0},
        {'text': 'Bolsonaro', 'score': 0},
      ],
    },
    {
      'questionText':
          'Quantos "doutores" existiram no momento atual da historia?',
      'image': 'lib/assets/doctors_line.jpg',
      'answers': [
        {'text': '17', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '21', 'score': 0},
        {'text': '15', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual o nome do veiculo de transporte do "Doutor"?',
      'image': 'lib/assets/tardis_art.jpg',
      'answers': [
        {'text': 'Marie Curie', 'score': 0},
        {'text': 'Gerty Cori', 'score': 0},
        {'text': 'Elizabeth Blackwell ', 'score': 0},
        {'text': 'TARDIS', 'score': 1},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  bool _showingAnswer = false;
  int? _selectedAnswer;

  void _answerQuestion(int score, int index) {
    if (_showingAnswer)
      return; // Impede cliques adicionais enquanto mostra a resposta
    setState(() {
      _totalScore += score;
      _showingAnswer = true;
      _selectedAnswer = index;
    });

    Future.delayed(const Duration(seconds: 2), () {
      // Tempo de delay entre uma pergunta e outra -> seconds: x
      if (_questionIndex + 1 < _questions.length) {
        setState(() {
          _questionIndex++;
          _showingAnswer = false;
          _selectedAnswer = null;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaResultado(
              totalScore: _totalScore,
              totalQuestions: _questions.length,
              resetQuiz: _resetQuiz,
            ),
          ),
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _showingAnswer = false;
      _selectedAnswer = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/assets/tardis_icon.png'),
          ),
          title: const Text('Quiz Doctor'),
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
                const SizedBox(height: 10),
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(60, 58, 192, 0.808),
                      width: 2,
                    ),
                  ),
                  child: Image.asset(
                    _questions[_questionIndex]['image'].toString(),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: _questionIndex < _questions.length
                      ? Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/background_questions.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      color: Colors.blue.shade900, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                _questions[_questionIndex]
                                        ['questionText'] // Pergunta
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/background_questions.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                    color: Colors.blue.shade900, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Pergunta ${_questionIndex + 1} de ${_questions.length}', // Contador de perguntas
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ...(_questions[_questionIndex]
                                        ['answers'] // Respostas
                                    as List<Map<String, Object>>)
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final answer = entry.value;
                              final isCorrect = answer['score'] == 1;
                              final isSelected = _selectedAnswer == index;

                              // Define a cor do botão
                              final Color buttonColor;
                              if (_showingAnswer) {
                                if (isCorrect) {
                                  buttonColor = Colors.green; // Correto
                                } else if (isSelected) {
                                  buttonColor = Colors.red; // Errado
                                } else {
                                  buttonColor = Colors.grey; // Neutro
                                }
                              } else {
                                buttonColor = Colors.blue; // Azul padrão
                              }

                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: _showingAnswer
                                        ? null // Desativa os cliques durante o feedback
                                        : () => _answerQuestion(
                                            answer['score'] as int, index),
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      margin: const EdgeInsets.symmetric(vertical: 4),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('lib/assets/background_questions.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(color: buttonColor, width: 3),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        answer['text'].toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              );
                            }),
                          ],
                        )
                      : const Center(child: Text('Finalizando Quiz...')),
                ),
              ],
            ),
          ),
        ));
  }
}
