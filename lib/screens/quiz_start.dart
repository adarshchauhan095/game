import 'package:flutter/material.dart';
import 'package:game/widgets/global.dart';

class QuizStart extends StatefulWidget {
  static const String routeName = "/quiz-start";
  @override
  _QuizStartState createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  double initialValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 25),
          stepIndicator(initialValue),
          SizedBox(height: 25),
          GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 200.0,
                        width: 320.0,
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: text(
                              "this is the question?",
                              fontSize: 28.0,
                              maxLine: 5),
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            quizCardSelection("A.", "option1", () {
                              setState(() {
                                initialValue = initialValue + 0.1;
                              });
                            }),
                            quizCardSelection("B.", "option2", () {}),
                            quizCardSelection("C.", "option3", () {}),
                            quizCardSelection("D.", "option4", () {}),
                          ],
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
    
  }
}
