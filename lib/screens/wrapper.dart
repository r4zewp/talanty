import 'package:flutter/material.dart';
import 'package:talenty_two/models/user.dart';
import 'package:talenty_two/screens/auth/auth.dart';
import 'package:talenty_two/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserObj>(context);
    //return either home or auth widgets
    if (userProvider == null) {
      return Auth();
    } else {
      return Home();
    }
  }
}
