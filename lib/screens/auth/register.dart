import 'package:flutter/material.dart';
import 'package:talenty_two/constants.dart';
import 'package:talenty_two/services/auth_service.dart';
import 'package:talenty_two/loading.dart';

class Register extends StatefulWidget {
  final Function toggleViewParam;
  Register({this.toggleViewParam});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String regLogin = '';
  String regPassword = '';
  final _registerFormKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading ? Loading() : Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.assignment_ind),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          widget.toggleViewParam();
        },
      ),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: authTopContainerStyle,
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
                      'Talanty',
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
          ),
          SizedBox(height: size.height * 0.1),
          Container(
            width: size.width * 0.7,
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: Column(
                      children: [
                        Text(
                            'Register now!',
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
                  //login
                  TextFormField(
                    obscureText: false,
                    decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
                    validator: (loginValue) => (loginValue.isEmpty) ? 'Please, fill in the e-mail field' : null,
                    onChanged: (loginValue) {
                      setState(() {
                        regLogin = loginValue;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  //password
                  TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (passValue) => passValue.length < 6 ? 'Password should contain more than 6 symbols' : null,
                      onChanged: (passValue) {
                        regPassword = passValue;
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
                          color: kPrimaryColor,
                          onPressed: () async {
                            if(_registerFormKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.registerEmailAndPassword(regLogin, regPassword);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Your e-mail format is wrong. Please, try again.';
                                });
                              } else {}
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
