import 'package:first_app/question.dart';
import 'package:first_app/question_screeen.dart';
import 'package:first_app/result_screen.dart';
import 'package:flutter/material.dart';

import 'package:first_app/quiz_flutter.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'quiz-flutter';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
      selectedAnswers = [];
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = QuizFLutter(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswers: chooseAnswers);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: switchScreen,
      );
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.blueGrey],
                  begin: Alignment.topLeft)),
          child: screenWidget),
    ));
    ;
  }
}
