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

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex + 1 < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    } else {
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
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 72, 69, 216),
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
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
                            .map((answer) {
                          return Column(
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    _answerQuestion(answer['score'] as int),
                                child: Text(answer['text'].toString()),
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
