import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer=[];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = 'questions-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
       print("switch scren");   
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length==questions.length){
      setState(() {
        activeScreen='result-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer=[];
      activeScreen='questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {

    // ignore: non_constant_identifier_names
    Widget ScreenWidget=StartScreen(switchScreen);

    if(activeScreen=='questions-screen'){
      ScreenWidget= QuestionScreen(onSelectAnswer: chooseAnswer,);
    }

    if(activeScreen=='result-screen'){
      ScreenWidget=ResultsScreen(choosenAnswer: selectedAnswer,onRestart:restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 121, 11, 155),
            Color.fromARGB(255, 49, 6, 179)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: ScreenWidget,
        ),
      ),
    );
  }
}
