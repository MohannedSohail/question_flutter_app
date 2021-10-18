import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(this.question, this.questionIndex, this.answerQuestion) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionIndex]['questionText']),

        ...(question[questionIndex]['answers'] as List<Map<String,Object>>).map((m) {

          return  Answer(()=> answerQuestion(m['score']), m['text']);
        }).toList(),

      ],
    );
  }
}
