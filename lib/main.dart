import 'package:flutter/material.dart';
import 'package:question_flutter_app/result.dart';
import 'question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalscore = 0;
  int num0 = 0, num1 = 0, num2 = 0, num3 = 0;

  bool isSwitched = false;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
      num3 = 0;
    });

    print("_questionIndex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("num3=$num3");
    print("_totalscore=$_totalscore");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your Favorite color?',
      'answers': [
        {'text': 'Green', 'score': 10},
        {'text': 'Black', 'score': 30},
        {'text': 'Yellow', 'score': 40},
        {'text': 'Blue', 'score': 20},
        {'text': 'Red', 'score': 50}
      ]
    },
    {
      'questionText': 'What\'s your Favorite Animals?',
      'answers': [
        {'text': 'Gorella', 'score': 10},
        {'text': 'Lion', 'score': 15},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Rabbit', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your Favorite Name?',
      'answers': [
        {'text': 'Mohanned', 'score': 25},
        {'text': 'Ahmed', 'score': 10},
        {'text': 'Ali', 'score': 18},
        {'text': 'Belal', 'score': 14},
        {'text': 'Taher', 'score': 27}
      ]
    },
    {
      'questionText': 'What\'s your Favorite Vegetabiles?',
      'answers': [
        {'text': 'Appel', 'score': 40},
        {'text': 'Grabs', 'score': 6},
        {'text': 'Melon', 'score': 36},
        {'text': 'Lemon', 'score': 16}
      ]
    },
  ];

  void answerQuestion(int score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2)
      num2 = score;
    else if (_questionIndex == 3) num3 = score;
    _totalscore += score;
    setState(() {
      _questionIndex += 1;
    });

    print("_questionIndex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("num3=$num3");
    print("_totalscore=$_totalscore");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App", style: TextStyle(color: b)),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black87;
                  }
                  if (isSwitched == false) {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });

              },

              inactiveThumbColor: b,
              inactiveTrackColor: w,
              activeColor: b,
            ),
          ],
        ),
        body: Container(
            width: double.infinity,
            color: w,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalscore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: b,
            size: 30,
          ),
          onPressed: () {
            if (_questionIndex == 1) {
              _totalscore -= num0;
              num0 = 0;
            } else if (_questionIndex == 2) {
              _totalscore -= num1;
              num1 = 0;
            } else if (_questionIndex == 3) {
              _totalscore -= num2;
              num2 = 0;
            } else if (_questionIndex == 4) {
              _totalscore -= num3;
              num3 = 0;
            }
            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });

            print("_questionIndex=$_questionIndex");
            print("num0=$num0");
            print("num1=$num1");
            print("num2=$num2");
            print("num3=$num3");
            print("_totalscore=$_totalscore");
          },
        ),
      ),
    );
  }
}
