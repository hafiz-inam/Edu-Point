import 'package:edupoint/Models/Question.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {

  final Question question;

  QuestionCard({this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: 400,
              height: 50,
              color: Colors.red,
            ),
          Container(
            width: 400,
            height: 50,
              color: Colors.orange,
            ),
          Container(
            width: 400,
            height: 50,
              color: Colors.indigo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('Reset'),
                    onPressed: (){

                    },
                  ),
                  RaisedButton(
                    child: Text('Next'),
                    onPressed: (){

                    },
                  ),
                ],
              ),
            ),
        ],
      );
  }
}
