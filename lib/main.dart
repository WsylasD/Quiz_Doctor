import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
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
                ? Quiz(
                    questions: _questions,
                    questionIndex: _questionIndex,
                    answerQuestion: _answerQuestion,
                  )
                : Result(
                    totalScore: _totalScore,
                    resetQuiz: _resetQuiz,
                  ),
          ),
        ],
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'].toString(),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => answerQuestion(answer['score'] as int),
            answer['text'].toString(),
          );
        }).toList(),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  Result({required this.totalScore, required this.resetQuiz});

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetQuiz,
            child: Text('Reiniciar Quiz'),
          ),
        ],
      ),
    );
  }
}
