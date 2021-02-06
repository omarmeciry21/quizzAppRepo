import 'package:flutter/material.dart';
import 'package:quiz_app/quizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> resultsBar = [];

  QuizBank quizBank = QuizBank();

  void checkAnswer(bool userAnswer, BuildContext buildContext) {
    bool correctAnswer = quizBank.getQuestionAnswer();
    if (!quizBank.isFinished()) {
      setState(() {
        if (userAnswer == correctAnswer) {
          resultsBar.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          resultsBar.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBank.moveToNext();
      });
    } else {
      showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert!!"),
            content: new Text("You are awesome!"),
            actions: <Widget>[
              new TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBank.getQuestionText(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Text(
                    "True",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(true, context);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text(
                    "False",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      checkAnswer(false, context);
                    });
                  },
                ),
              ),
            ),
            Row(
              children: resultsBar,
            )
          ],
        ),
      ),
    );
  }
}
