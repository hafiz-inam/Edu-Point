import 'package:edupoint/Models/Question.dart';
import 'package:edupoint/Services/Database.dart';
import 'package:edupoint/Views/QuizPlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstructionScreen extends StatelessWidget {

  final String quizId;
  InstructionScreen(this.quizId);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Question>>.value(
      value: Database(quizId: quizId).questionData,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: QuizPlay()
      ),
    );
  }
}
