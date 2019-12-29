import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final _questions = [
    {
      'questionText': 'Question 1',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 7}
      ]
    },
    {
      'questionText': 'Question 2',
      'answers': [
        {'text': '11', 'score': 1},
        {'text': '5', 'score': 6},
        {'text': '12', 'score': 4}
      ]
    },
    {
      'questionText': 'Question 3',
      'answers': [
        {'text': 'A', 'score': 5},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      _totalScore += score;
      print('totalScore: ');
      print(_totalScore);
      setState(() {
        _questionIndex++;
      });
    } else {
      print('Out of _questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
