import 'package:flutter/material.dart';
import 'package:talenty_two/constants.dart';
import 'package:talenty_two/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:talenty_two/services/database.dart ';
import 'package:talenty_two/screens/home/clients_list.dart';
import 'package:talenty_two/models/clientObj.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamProvider<List<ClientObj>>.value(
      value: DatabaseService().clientCardState,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: size.height * 0.09,
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            elevation: 5.0,
            backgroundColor: kPrimaryColor,
          ),
          backgroundColor: Colors.white,
          drawer: Container(
            width: size.width * 0.4,
            child: Drawer(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    ),
                    width: double.infinity,
                    height: size.height * 0.09,
                    child: Center(
                      child: Text(
                        'Talanty app',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          ),
                        ),
                    )
                  ),
                  Center(
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        'My profile (soon)',
                        style: TextStyle(
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Settings (soon)',
                      style: TextStyle(
                        fontFamily: 'Poppins'
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black
                  ),
                  FlatButton(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      )
                    ),
                    onPressed: () async {
                        await _auth.signOut();
                     },
                  ),
                  Divider(
                    color: Colors.black,
                  )
                ],
              )
            ),
          ),
          body: ClientsList(),
        ),
      ),
    );
  }
}
