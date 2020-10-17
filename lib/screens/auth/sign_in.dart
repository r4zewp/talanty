import 'dart:convert';
import 'package:talenty_two/constants.dart';
import 'package:flutter/material.dart';
import 'package:talenty_two/services/auth_service.dart';
import 'package:talenty_two/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleViewParam;
  SignIn({this.toggleViewParam});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  //text field state
  String login = '';
  String password = '';
  final _signinFormKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red[400],
        onPressed: () {
          widget.toggleViewParam();
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Text(
                      'Talenty',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Text(
                      'place where dream comes true',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: authTopContainerStyle,
          ),
         SizedBox(height: size.height * 0.1),
          Container(
           width: size.width * 0.7,
            child: Form(
              key: _signinFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: Column(
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontSize: 21,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 4.0),
                                blurRadius: 3.0,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ]
                          )
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  ///////////////////////////////login
                  TextFormField(
                    obscureText: false,
                    decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
                    validator: (loginValue) => loginValue.isEmpty ? 'Enter an e-mail' : null,
                    onChanged: (loginValue) {
                      setState(() {
                        login = loginValue;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  /////////////////////////////////password
                  TextFormField(
                    obscureText: true,
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (passValue) => passValue.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (passValue) {
                      password = passValue;
                    }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.15),
                      SizedBox(
                        width: size.width * 0.7,
                        height: size.height * 0.07,
                        child: RaisedButton(
                          color: Colors.red[400],
                          onPressed: () async {
                            if(_signinFormKey.currentState.validate()){
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth.signInEmailAndPassword(login, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'couldnt sign with this data';
                                });
                              } else {}
                            }
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.1),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red[400]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
