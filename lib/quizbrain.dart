import 'package:quiz_app/Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(questionText: 'JAVA DBMS GOOD', questionAnswer: true),
    Question(questionText: 'DSA is Easy', questionAnswer: false),
    Question(questionText: 'OS nahi aata', questionAnswer: true),
    Question(questionText: 'Ayush sad', questionAnswer: true),
    Question(questionText: 'Like Cricket', questionAnswer: true),
    Question(questionText: 'Bored', questionAnswer: true),
    Question(questionText: 'Guilty', questionAnswer: true),
    Question(questionText: 'Hungry', questionAnswer: false),
    Question(questionText: 'Studyyyyyy', questionAnswer: true),
    Question(questionText: 'Badme quiz khelna', questionAnswer: false),
  ];

  void questionNumber() {
      _questionNumber++;
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber < _questionBank.length - 1){
      return false;
    }
    else{
      return true;
    }
  }

  void retake(){
    _questionNumber=0;
  }
}
