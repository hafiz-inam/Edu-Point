import 'package:edupoint/Services/Database.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;

  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String quizId;
  String question;
  String optionA;
  String optionB;
  String optionC;
  String optionD;

  int questionNo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'Question No $questionNo'),
                    onChanged: (val) => setState(() => question = val),
                    validator: (val) => val.isEmpty ? 'Type Question' : null,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'Option A (Correct)'),
                    onChanged: (val) => setState(() => optionA = val),
                    validator: (val) => val.isEmpty ? 'Enter option' : null,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'Option B'),
                    onChanged: (val) => setState(() => optionB = val),
                    validator: (val) => val.isEmpty ? 'Enter option' : null,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'Option C'),
                    onChanged: (val) => setState(() => optionC = val),
                    validator: (val) => val.isEmpty ? 'Enter option' : null,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextFormField(
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'Option D'),
                    onChanged: (val) => setState(() => optionD = val),
                    validator: (val) => val.isEmpty ? 'Enter option' : null,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });

                        await Database().addQuestion(widget.quizId, question,
                            optionA, optionB, optionC, optionD);
                        print(question);
                        print(optionA);
                        print(optionB);
                        print(optionC);
                        print(optionD);
                        setState(() {
                          _formKey.currentState.reset();
                          questionNo = questionNo + 1;
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
                              'Add Question',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                  ),
                  SizedBox(height: 24),
                ]))));
  }
}
