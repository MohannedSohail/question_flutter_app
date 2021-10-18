import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int resultscore;

  const Result(this.reset, this.resultscore);

  String get resultvalidation {
    String resultText;
    if (resultscore >= 70) {
      resultText = "Great Score";
    } else if (resultscore >= 40) {
      resultText = "Good Score ";
    } else {
      resultText = "Very Bad Score ";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Score Is [$resultscore]",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: b),
          textAlign: TextAlign.center,
        ),
        Text(
          resultvalidation,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal),
          textAlign: TextAlign.center,
        ),
        FlatButton(
            onPressed: reset,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Restart The App ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                  ),
                ),
                Icon(Icons.settings_backup_restore,color: b,size: 30,),
              ],
            )),
      ],
    ));
  }
}
