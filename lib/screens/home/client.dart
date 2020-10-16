import 'package:flutter/material.dart';
import 'package:talenty_two/models/user.dart';

class ClientTile extends StatelessWidget {
  final UserObj client;
  ClientTile({
    this.client
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey,
          ),
          title: Text(client.name)
          //title: Text(client.name)
        ),
      ),
    );
  }
}
