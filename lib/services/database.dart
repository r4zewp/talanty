import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talenty_two/models/clientObj.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference clientCards = FirebaseFirestore.instance.collection('clientCards');

  Future updateUserData(String name, String service, int price) async {
    return await clientCards.doc(uid).set({
      'name': name,
      'service': service,
      'price': price,
    });
  }

  // list from snapshot
  List<ClientObj> _clientListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      var clientData = doc.data();
      return ClientObj(
        name: clientData['name'] ?? '',
        service: clientData['service'] ?? '',
        price: clientData['price'] ?? 0,
      );
    }).toList();
  }

  Stream<List<ClientObj>> get clientCardState {
    return clientCards.snapshots().map(_clientListFromSnapshot);
  }
}