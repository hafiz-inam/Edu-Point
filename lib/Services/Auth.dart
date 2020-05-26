import 'package:edupoint/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  registerUsingEmailAndPassword(String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  signInUsingEmailAndPassword(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  signOutUser() {
    try {
      firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<FirebaseUser> get signedInUser {
    return firebaseAuth.onAuthStateChanged;
  }
}
