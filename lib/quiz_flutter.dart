import 'package:flutter/material.dart';

class QuizFLutter extends StatelessWidget {
  const QuizFLutter(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset('assets/images/unnamed.png'),
        const Text(
          'Quiz of flutter',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: startQuiz,
          label: const Text(
            'Start quiz',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color.fromARGB(232, 232, 238, 48)),
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Color.fromARGB(232, 232, 238, 48),
          ),
        )
      ]),
    );
  }
}
