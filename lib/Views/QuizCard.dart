import 'package:edupoint/Models/Quiz.dart';
import 'package:edupoint/Views/InstructionScreen.dart';
import 'package:edupoint/Views/QuizPlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  QuizCard({this.quiz});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(quiz.quizId);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => InstructionScreen(quiz.quizId)
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        height: 150,
        width: MediaQuery.of(context).size.height - 48,
        decoration: BoxDecoration(
            color: Colors.grey,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black87,
                image: DecorationImage(
                  image: NetworkImage(quiz.quizImageUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  quiz.quizTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                  quiz.quizDescription,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
