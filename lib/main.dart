// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestionIndex = 0;
  var _totalScore = 0;
  final List<int> _correctAnswers = [];

  final List<Map<String, Object>> _questions = const [
    {
      'texto': 'Qual é a capital da França?',
      'respostas': [
        {'texto': 'Paris', 'correta': true},
        {'texto': 'Londres', 'correta': false},
        {'texto': 'Berlim', 'correta': false},
        {'texto': 'Madrid', 'correta': false},
      ]
    },
    {
      'texto': 'Quem desenvolveu a teoria da relatividade?',
      'respostas': [
        {'texto': 'Isaac Newton', 'correta': false},
        {'texto': 'Albert Einstein', 'correta': true},
        {'texto': 'Galileu Galilei', 'correta': false},
        {'texto': 'Nikola Tesla', 'correta': false},
      ]
    },
    {
      'texto': 'Qual é o maior planeta do nosso sistema solar?',
      'respostas': [
        {'texto': 'Terra', 'correta': false},
        {'texto': 'Marte', 'correta': false},
        {'texto': 'Júpiter', 'correta': true},
        {'texto': 'Saturno', 'correta': false},
      ]
    },
    {
      'texto': 'Quanto é o resultado de -2 X 2?',
      'respostas': [
        {'texto': '5', 'correta': false},
        {'texto': '-5', 'correta': false},
        {'texto': '4', 'correta': true},
        {'texto': '8', 'correta': false},
      ]
    }
  ];

  void _answerQuestion(bool correct) {
    if (hasSelectedQuestion) {
      setState(() {
        if (correct) {
          _totalScore++;
          _correctAnswers.add(_selectedQuestionIndex);
        }
        _selectedQuestionIndex++;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestionIndex = 0;
      _totalScore = 0;
      _correctAnswers.clear();
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestionIndex < _questions.length;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: hasSelectedQuestion
              ? Quiz(_questions, _selectedQuestionIndex, _answerQuestion)
              : Result(_totalScore, _restartQuiz, _correctAnswers, _questions),
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
