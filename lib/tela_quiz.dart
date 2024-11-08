import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  final _questions = [
    {
      'questionText': 'Qual a melhor serie de televisão Britanica?',
      'answers': [
        {'text': 'Friends', 'score': 0},
        {'text': 'The big Bang Theory', 'score': 0},
        {'text': 'Doctor Who', 'score': 1},
        {'text': 'Doctor House', 'score': 0},
      ],
    },
    {
      'questionText': 'Quem é o Doutor?',
      'answers': [
        {'text': 'Dr. Shaun Murphy', 'score': 0},
        {'text': 'Dr. House', 'score': 0},
        {'text': 'Doutor Quem?', 'score': 1},
        {'text': 'Hipócrates de Cós', 'score': 0},
      ],
    },
    {
      'questionText': 'Quem é o maior inimigo do Doutor?',
      'answers': [
        {'text': 'Uma Maçã', 'score': 0},
        {'text': 'Daleks', 'score': 1},
        {'text': 'Andrew Wakefield', 'score': 0},
        {'text': 'Bolsonaro', 'score': 0},
      ],
    },
    {
      'questionText': 'Qual médico é conhecido como o "pai da vacina"?',
      'answers': [
        {'text': 'Louis Pasteur', 'score': 0},
        {'text': 'Edward Jenner', 'score': 1},
        {'text': 'Alexander Fleming', 'score': 0},
        {'text': 'William Harvey', 'score': 0},
      ],
    },
    {
      'questionText':
          'Quem foi responsável pela descoberta da penicilina, o primeiro antibiótico eficaz?',
      'answers': [
        {'text': 'Marie Curie', 'score': 0},
        {'text': 'Joseph Lister', 'score': 0},
        {'text': 'Alexander Fleming', 'score': 1},
        {'text': 'Robert Koch', 'score': 0},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });

    if (_questionIndex >= _questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaResultado(
            totalScore: _totalScore,
            resetQuiz: _resetQuiz,
          ),
        ),
      );
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    Navigator.pop(context); // Tela Inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Doctor'),
        backgroundColor: const Color.fromARGB(255, 30, 49, 218),
      ),
      body: Column(
        children: [
          Image.asset(
            'lib/assets/tardis_doctor_who.jpg',
            height: 300,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: _questionIndex < _questions.length
                ? Column(
                    children: [
                      Text(
                        _questions[_questionIndex]['questionText'].toString(),
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      ...(_questions[_questionIndex]['answers']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return ElevatedButton(
                          onPressed: () =>
                              _answerQuestion(answer['score'] as int),
                          child: Text(answer['text'].toString()),
                        );
                      }).toList(),
                    ],
                  )
                : Center(child: Text('Finalizando Quiz...')),
          ),
        ],
      ),
    );
  }
}
