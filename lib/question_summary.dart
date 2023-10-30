import 'package:first_app/question_identify.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuestionIdentify(
                  question_text:
                      (((data['question_index']) as int) + 1).toString(),
                  isCorrect: (data['user_answer'] == data['correct_answer']),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          data['question_text'] as String,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(238, 228, 207, 48)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:
                                (data['user_answer'] == data['correct_answer'])
                                    ? Colors.greenAccent
                                    : Colors.redAccent),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          child: Text(
                        ((data['user_answer'] != data['correct_answer'])
                            ? data['correct_answer']
                            : '') as String,
                        style: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ))
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
