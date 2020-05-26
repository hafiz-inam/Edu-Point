import 'package:edupoint/Models/User.dart';
import 'package:edupoint/Services/Auth.dart';
import 'package:edupoint/Views/SignIn.dart';
import 'package:edupoint/Views/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
