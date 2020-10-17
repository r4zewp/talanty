import 'package:flutter/material.dart';
import 'package:talenty_two/constants.dart';
import 'package:talenty_two/models/clientObj.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientTile extends StatelessWidget {

  final ClientObj client;
  ClientTile({this.client});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shadowColor: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(client.avatarLink),
                ),
                title: Text(
                  client.name,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 19,
                  )
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        client.service,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.03, bottom: size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${client.price} ₽',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                      ),
                    ),
                    OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.0,
                      ),
                      child: Text(
                        'More',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: kPrimaryColor,
                        ),
                      ),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          // false = user must tap button, true = tap outside dialog
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${client.name}'s profile",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                   Divider(
                                     color: Colors.black,
                                     thickness: 3.0,
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         margin: EdgeInsets.only(top: size.height * 0.015),
                                         width: size.width * 0.15,
                                         height: size.height * 0.09,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                             image: NetworkImage(client.avatarLink),
                                             fit: BoxFit.fill,
                                           )
                                         ),
                                       ),
                                     ],
                                   ),
                                  ],
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                      children: [
                                        // name
                                        Text(
                                          client.name
                                        ),
                                        //service
                                        Text(
                                          client.service
                                        ),
                                        //price
                                        Text(
                                          '${client.price} ₽'
                                        ),
                                        //contacts
                                        Row(),
                                      ],
                                    ),
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: () async {
                                    //print(serviceChange);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
