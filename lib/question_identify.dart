import 'package:flutter/material.dart';

class QuestionIdentify extends StatelessWidget {
  const QuestionIdentify(
      {super.key, required this.isCorrect, required this.question_text});
  final bool isCorrect;
  final String question_text;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: isCorrect
                ? const Color.fromARGB(255, 19, 161, 204)
                : const Color.fromARGB(181, 222, 71, 71)),
        child: Center(
          child: Text(
            question_text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 247, 249, 249),
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
