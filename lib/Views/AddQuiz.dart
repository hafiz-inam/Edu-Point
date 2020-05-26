import 'package:edupoint/AddQestion.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:edupoint/Services/Database.dart';

class AddQuiz extends StatefulWidget {
  @override
  _AddQuizState createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String quizId;
  String quizTitle;
  String quizImageUrl;
  String quizDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Quiz Title'),
                    onChanged: (val) => setState(() => quizTitle = val),
                    validator: (val) => val.isEmpty ? 'Enter Quiz Title' : null,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Quiz Image'),
                    onChanged: (val) => setState(() => quizImageUrl = val),
                    validator: (val) => val.isEmpty ? 'Enter Image URL' : null,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Quiz Descrption'),
                    onChanged: (val) => setState(() => quizDescription = val),
                    validator: (val) =>
                        val.isEmpty ? 'Enter Quiz Desciption' : null,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });

                        quizId = randomAlphaNumeric(16);
                        await Database().addQuiz(
                            quizId, quizTitle, quizImageUrl, quizDescription);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddQuestion(quizId)));
                        print(quizTitle);
                        print(quizDescription);
                        print(quizImageUrl);
                        print(quizId);
                        setState(() {
                          loading = false;
                        });
                      }
                    },
                    child: loading
                        ? CircularProgressIndicator()
                        : Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.height - 48,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Create Quiz',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                  ),
                  SizedBox(height: 24),
                ]))));
  }
}
