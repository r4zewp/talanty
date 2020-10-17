import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_two/models/clientObj.dart';
import 'package:talenty_two/services/auth_service.dart';
import 'client.dart';



class ClientsList extends StatefulWidget {
  @override
  _ClientsListState createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    final clientsListProvider = Provider.of<List<ClientObj>>(context);
    if (clientsListProvider.length != null) {
        return ListView.builder(
            itemCount: clientsListProvider.length,
            itemBuilder: (context, index){
              return ClientTile(client: clientsListProvider[index]);
            });
    }
//        ListView.builder(
//          itemCount: clientsListProvider.length,
//          itemBuilder: (context, index){
//            return ClientTile(client: clientsListProvider[index]);
//        },

    }
  }

