import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
       _questionIndex = 0;
       _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        { 'text': 'Black','score': 10 },
        { 'text': 'Red','score': 9 },
        { 'text': 'Blue','score': 8 },
        { 'text': 'White','score': 7 }, 
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 9},
        {'text': 'Fish', 'score': 8},
        {'text': 'Rabbit', 'score': 7},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        { 'text': 'The Net Ninja', 'score': 10}, 
        { 'text': 'Academind', 'score': 9}, 
        { 'text': 'Coursera', 'score': 8}, 
      ] 
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? 
            Quiz(
              answerQuestion: _answerQuestion, 
              questions: _questions, 
              questionIndex: _questionIndex,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
