import 'package:edupoint/Services/Auth.dart';
import 'package:edupoint/Views/Loading.dart';
import 'package:edupoint/Views/SignIn.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool isRegistered = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              brightness: Brightness.light,
            ),
            body: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                    TextFormField(
                      validator: (val) =>
                          val.contains('@') ? null : 'Enter a valid email',
                      onChanged: (val) => setState(() => email = val),
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => val.length > 6
                          ? null
                          : 'Enter a password with 6+ characters',
                      onChanged: (val) => setState(() => password = val),
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final result = await Auth()
                              .registerUsingEmailAndPassword(
                                  email.trim(), password);
                          setState(() {
                            loading = true;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.height - 48,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already have an account ?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
  }
}
