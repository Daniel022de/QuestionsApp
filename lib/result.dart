import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuiz;
  final List<int> correctAnswers;
  final List<Map<String, Object>> questions;

  const Result(
    this.score,
    this.restartQuiz,
    this.correctAnswers,
    this.questions,
  );

  String get resultPhrase {
    if (score == questions.length) {
      return 'Parabéns! Você acertou todas as perguntas!';
    } else if (score > questions.length / 2) {
      return 'Você foi bem!';
    } else if (score > 0) {
      return 'Você pode melhorar!';
    } else {
      return 'Nenhuma resposta certa';
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
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Você acertou $score de ${questions.length} perguntas.',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 40),
          if (correctAnswers.isNotEmpty)
            const Text(
              'Perguntas corretas:',
              style: TextStyle(fontSize: 22),
            ),
          if (correctAnswers.isNotEmpty)
            ...correctAnswers.map((index) {
              return Text(
                questions[index]['texto'] as String,
                style: const TextStyle(fontSize: 18),
              );
            }).toList(),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: restartQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
