
import 'package:quiz_app/question.dart';

class QuizBank {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question("Question 1", false),
    Question("Question 2", true),
    Question("Question 3", false),
    Question("Question 4", true),
    Question("Question 5", false),
    Question("Question 6", true),
    Question("Question 7", true),
    Question("Question 8", true),
    Question("Question 9", false),
    Question("Question 10", true),
    Question("Question 11", false),
    Question("Question 12", false),
  ];

  void moveToNext() {
    if (_questionNumber < _questions.length - 1)
      _questionNumber++;
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  bool isFinished() => _questionNumber==(_questions.length-1);

  void resetQuiz(){
    _questionNumber=0;
  }
}
