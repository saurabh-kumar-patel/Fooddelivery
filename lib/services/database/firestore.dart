

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  // get collection of orders

  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  // Save order to db
Future<void> saveOrderToDatabase(String receipt) async{
  await orders.add({
    'date': DateTime.now(),
    'order':receipt,

    // add more field as necessary....
  });
}
}