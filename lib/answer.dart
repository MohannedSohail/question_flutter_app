import 'package:flutter/material.dart';
import 'main.dart';

class Answer extends StatelessWidget {

  final answerText;
  final Function onpressed;

  const Answer(this.onpressed,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        textColor: b,
        child: Text(answerText,style:TextStyle(fontSize: 25),),
        onPressed: onpressed,
      ),
    );
  }
}
