import 'package:first_app/answer_question.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.chooseAnswers});

  final void Function(String answer) chooseAnswers;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var numberQuestion = 0;

  void setNumberQuestion(String selectedAnswers) {
    widget.chooseAnswers(selectedAnswers);
    setState(() {
      numberQuestion += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[numberQuestion];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getListShuffle().map((answer) {
                return AnswerButton(
                    answerQuestion: answer,
                    onTab: () {
                      setNumberQuestion(answer);
                    });
              })
            ]),
      ),
    );
  }
}
