import 'package:flutter/material.dart';
import 'package:project_questions/answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(bool) answerQuestion;

  Quiz(this.questions, this.selectedQuestion, this.answerQuestion);

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion].cast()['respostas']
        : [];

    return Column(
      children: [
        Question(questions[selectedQuestion].cast()['texto']),
        ...answers.map((answer) {
          return Answer(
            answer['texto'].toString(),
            () => answerQuestion(answer['correta'] as bool),
          );
        }).toList()
      ],
    );
  }
}
