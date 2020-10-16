import 'package:flutter/material.dart';
import 'package:talenty_two/screens/auth/register.dart';
import 'package:talenty_two/screens/auth/sign_in.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignIn = true;

  //function to toggle showing sign in screen
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleViewParam: toggleView);
    } else return Register(toggleViewParam: toggleView);
  }
}
