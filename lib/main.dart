import 'package:flutter/material.dart';
import 'package:quiz_app/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MaterialApp(
    home: QuizApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  void checkAnswer(bool answerChosen) {
    bool correctAnswer = qb.getAnswer();
    setState(() {
      if(!qb.isFinished()) {
        if (correctAnswer == answerChosen) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        qb.questionNumber();
      }
      else
        {
          // Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
          Alert(
            // image: AssetImage('assets/pc5o78d9i.png'),
            context: context,
            type: AlertType.error,
            title: "Quiz Complete!",
            desc: "Stay tuned for more quizzes",
            buttons: [
              DialogButton(
                child: const Text(
                  "Retake",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: (){
                  setState(() {
                    qb.retake();
                    scoreKeeper = [];
                    Navigator.pop(context);
                  });
                  },
                width: 120,
              )
            ],
          ).show();
        }
    });
  }

  List<Widget> scoreKeeper = [];
  QuizBrain qb = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(qb.getQuestion(),
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          )),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
