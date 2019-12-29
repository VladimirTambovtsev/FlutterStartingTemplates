import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase => 'Out of questions';
  String get resultScorePhrase => 'Score: ' + resultScore.toString();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase, style: TextStyle(fontSize: 26)),
          Text(resultScorePhrase,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
