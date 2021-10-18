import 'package:flutter/material.dart';
import 'main.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20,right: 20,top: 35,bottom: 20),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 30,
          color: b,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
