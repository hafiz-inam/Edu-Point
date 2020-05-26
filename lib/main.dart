import 'package:edupoint/AddQestion.dart';
import 'package:edupoint/Services/Auth.dart';
import 'package:edupoint/Views/Authenticate.dart';
import 'package:edupoint/Views/Loading.dart';
import 'package:edupoint/Views/SignIn.dart';
import 'package:edupoint/Views/Wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Main()));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: Auth().signedInUser,
      child: Wrapper(),
    );
  }
}
