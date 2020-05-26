import 'package:edupoint/Models/Quiz.dart';
import 'package:edupoint/Services/Auth.dart';
import 'package:edupoint/Services/Database.dart';
import 'package:edupoint/Views/AddQuiz.dart';
import 'package:edupoint/Views/QuizList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Quiz>>.value(
      value: Database().quizList,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddQuiz()));
            },
          ),
          body: QuizList()),
    );
  }
}
