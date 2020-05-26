import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edupoint/Models/Question.dart';
import 'package:edupoint/Models/Quiz.dart';

class Database {

  String quizId;
  Database({this.quizId});

  final quizCollection = Firestore.instance.collection('Quiz');

  addQuiz(String quizId, String quizTitle, String quizImageUrl,
      String quizDesc) async {
    try {
      await quizCollection.document(quizId).setData({
        'quizId': quizId,
        'quizTitle': quizTitle,
        'quizImageURL': quizImageUrl,
        'quizDescription': quizDesc
      });
    } catch (e) {
      print(e.toString());
    }
  }

  List<Quiz> quizFromFirebase(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map((doc) {
      return Quiz(
          quizId: doc.data['quizId'],
          quizTitle: doc.data['quizTitle'],
          quizImageUrl: doc.data['quizImageURL'],
          quizDescription: doc.data['quizDescription']);
    }).toList();
  }

  Stream<List<Quiz>> get quizList {
    return quizCollection.snapshots().map(quizFromFirebase);
  }

  addQuestion(String quizId, String question, String optionA, String optionB,
      String optionC, String optionD) async {
    await quizCollection.document(quizId).collection('QnA').add({
      'Question': question,
      'Option A': optionA,
      'Option B': optionB,
      'Option C': optionC,
      'Option D': optionD
    });
  }

  List<Question> questionFromFirebaseQuestion(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Question(
        question: doc.data['Question'],
        optionA: doc.data['Option A'],
        optionB: doc.data['Option B'],
        optionC: doc.data['Option C'],
        optionD: doc.data['Option D'],
      );
    }).toList();
  }

  Stream<List<Question>> get questionData{
    return quizCollection.document(quizId).collection('QnA').snapshots().map(questionFromFirebaseQuestion);
  }

}
