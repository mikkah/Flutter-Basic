import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function resetQuiz;

  Result(this._totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if(_totalScore <= 25) {
      resultText = 'You are awesome';
    } else if( _totalScore <= 23) {
      resultText = 'Pretty likeable';
    } else {
      resultText = 'You are strange';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget> [
            Text(resultPhrase + '\n Score: $_totalScore',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)
            ),
            FlatButton(
              child: Text('Restart Quiz!'),
              textColor: Colors.blue,
              onPressed: resetQuiz,
            ),

          ]
        )
      );
  }
}
