import 'package:edupoint/Models/Quiz.dart';
import 'package:edupoint/Views/QuizCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Quiz> quizList = Provider.of<List<Quiz>>(context) ?? [];
    quizList.forEach((element) {
      print(element.quizTitle);
      print(element.quizDescription);
      print(element.quizImageUrl);
      print(element.quizId);
    });
    return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: ListView.builder(
                itemCount: quizList.length,
                itemBuilder: (context, index){
                  return QuizCard(quiz: quizList[index],);
                }),
            ),
          );
        }
  }
