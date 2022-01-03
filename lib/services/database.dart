import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
//collection reference
  final CollectionReference secretCollection =
      FirebaseFirestore.instance.collection('secrets');

  Future updateUserSecret(String sContext) async {
    return await secretCollection.doc(uid).set({'sContext': sContext});
  }
}
