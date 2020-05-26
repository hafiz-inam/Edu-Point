import 'package:edupoint/Views/Authenticate.dart';
import 'package:edupoint/Views/Home.dart';
import 'package:edupoint/Views/Loading.dart';
import 'package:edupoint/Views/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return user != null ? Home() : SignIn();
  }
}
