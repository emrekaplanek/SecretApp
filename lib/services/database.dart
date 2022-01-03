import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secret/models/secret.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
//collection reference
  final CollectionReference secretCollection =
      FirebaseFirestore.instance.collection('secrets');

  Future updateUserSecret(String sContext) async {
    return await secretCollection.doc(uid).set({'sContext': sContext});
  }

  List<Secret> _secretListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Secret(sContext: doc.get('sContext'));
    }).toList();
  }

  Stream<List<Secret>> get secrets {
    return secretCollection.snapshots().map(_secretListFromSnapshot);
  }
}
