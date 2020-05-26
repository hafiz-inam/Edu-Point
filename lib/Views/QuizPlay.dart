import 'package:edupoint/Models/Question.dart';
import 'package:edupoint/Views/QuestionCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPlay extends StatefulWidget {
  @override
  _QuizPlayState createState() => _QuizPlayState();
}

class _QuizPlayState extends State<QuizPlay> {


  @override
  Widget build(BuildContext context) {

    List<Question> question = Provider.of<List<Question>>(context);

    question.forEach((question) {
      print(question.question);
      print(question.optionA);
      print(question.optionB);
      print(question.optionC);
      print(question.optionD);
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: ListView.builder(
            itemCount: question.length,
            itemBuilder: (context, index){
              return QuestionCard(question: question[index],);
            }),
      ),
    );
  }
}
