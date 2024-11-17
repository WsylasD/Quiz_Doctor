import 'dart:async';
import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class TelaQuiz2 extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz2> {
  final _questions = [
    {
      'questionText': 'Qual a função principal da TARDIS?',
      'image': 'lib/assets/tardis_interior.jpg',
      'answers': [
      {'text': 'Navegar pelo espaço', 'score': 0},
      {'text': 'Viajar no tempo e espaço', 'score': 1},
      {'text': 'Arma secreta do Doutor', 'score': 0},
      {'text': 'Máquina do tempo pessoal', 'score': 0}
      ],
    },
    {
      'questionText': 'Qual vilão é conhecido por sua frase "Exterminate!"?',
      'image': 'lib/assets/doctor_nemesis.jpg',
      'answers': [
      {'text': 'Cybermen', 'score': 0},
      {'text': 'Daleks', 'score': 1},
      {'text': 'Mestre', 'score': 0},
      {'text': 'Weeping Angels', 'score': 0}
      ],
    },
    {
      'questionText': 'Qual companheira do Doutor é conhecida por sua frase "Allons-y!"?',
      'image': 'lib/assets/doctor_companions.jpg',
      'answers': [
      {'text': 'Rose Tyler', 'score': 0},
      {'text': 'Amy Pond', 'score': 0},
      {'text': 'Donna Noble', 'score': 1},
      {'text': 'Clara Oswald', 'score': 0}
      ],
    },
    {
      'questionText': 'O que acontece quando um Senhor do Tempo se regenera?',
      'image': 'lib/assets/doctor_who_regen.jpg',
      'answers': [
      {'text': 'Morre e renasce', 'score': 1},
      {'text': 'Viaja para outra dimensão', 'score': 0},
      {'text': 'Se torna mais poderoso', 'score': 0},
      {'text': 'Perde todas as memórias', 'score': 0}
      ],
    },
    {
      'questionText': 'Em qual episódio o Doutor conhece River Song pela primeira vez?',
      'image': 'lib/assets/RiverSong.jpg',
      'answers': [
        {'text': 'Silence in the Library', 'score': 0},
        {'text': 'Forest of the Dead', 'score': 1},
        {'text': 'The Impossible Astronaut', 'score': 0},
        {'text': 'The Pandorica Opens', 'score': 0},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  bool _showingAnswer = false; 
  int? _selectedAnswer; 

  void _answerQuestion(int score, int index) {
    if (_showingAnswer) return; // Impede cliques adicionais enquanto mostra a resposta
    setState(() {
      _totalScore += score;
      _showingAnswer = true;
      _selectedAnswer = index;
    });

    Future.delayed(const Duration(seconds: 2), () { // Tempo de delay entre uma pergunta e outra -> seconds: x
      if (_questionIndex + 1 < _questions.length) {
        setState(() {
          _questionIndex++;
          _showingAnswer = false;
          _selectedAnswer = null;
        });
      } else {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => TelaResultado(
              totalScore: _totalScore,
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
        title: const Text('Quiz Doctor'),
        backgroundColor: const Color.fromARGB(255, 51, 38, 236),
      ),
      body: Center(
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
                            color: Colors.blueAccent,
                            border: Border.all(
                                color: Colors.blue.shade900, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _questions[_questionIndex]['questionText']
                                .toString(),
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...(_questions[_questionIndex]['answers']
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
                                    : () =>
                                        _answerQuestion(answer['score'] as int, index),
                                child: Container(
                                  height: 45,
                                  width: 200,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(8),
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
    );
  }
}