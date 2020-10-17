import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talenty_two/constants.dart';
import 'package:talenty_two/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:talenty_two/services/database.dart ';
import 'package:talenty_two/screens/home/clients_list.dart';
import 'package:talenty_two/models/clientObj.dart';
import 'client.dart';


class Home extends StatelessWidget {

  final ClientObj client;
  Home({this.client});
  final _changeProfileFormKey = GlobalKey<FormState>();


  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamProvider<List<ClientObj>>.value(
      value: DatabaseService().clientCardState,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              IconButton(
               icon: Icon(Icons.person),
               onPressed: () {
                showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text('Your profile'),
                          content: Form(
                            key: _changeProfileFormKey,
                            child: Column(
                              children: [
                                //name
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: client.name
                                  ),
                                ),
                                //service
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: client.service
                                  ),
                                ),
                                //price
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: client.price.toString()
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('buttonText'),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  })
            ],
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
                        'Talenty app',
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
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'BBI-2008 HSE',
                        style: TextStyle(
                            color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        )
                      ),
                    ],
                  ),
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
