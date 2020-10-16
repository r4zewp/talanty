import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_two/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:talenty_two/services/auth_service.dart';
import 'package:talenty_two/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //streamProvider lets us to check if the user logged or not
    return StreamProvider<UserObj>.value(
      value: AuthService().streamUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Wrapper(),
      ),
    );
  }
}

