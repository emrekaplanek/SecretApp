import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secret/models/mySecret.dart';
import 'package:secret/models/secret.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference secretCollection =
      FirebaseFirestore.instance.collection('secrets');

  Future addUserSecret(String title, String sContext) async {
    print(uid);
    return await secretCollection
        .doc() //buraya id verirsen o id ile kayıt açar günceller.
        .set({'title': title, 'sContext': sContext, 'userId': uid});
  }

  //   Future updateUserSecret(String sContext) async {
  //   return await secretCollection.doc(uid).set({'sContext': sContext});
  // }

  List<Secret> _secretListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Secret(
          title: doc.get('title') ?? "",
          sContext: doc.get('sContext') ?? "",
          userId: doc.get('userId') ?? "");
    }).toList();
  }

  List<MySecret> _mySecretListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MySecret(
          title: doc.get('title') ?? "",
          sContext: doc.get('sContext') ?? "",
          userId: doc.get('userId') ?? "");
    }).toList();
  }

  Stream<List<Secret>>? get secrets {
    return secretCollection.snapshots().map(_secretListFromSnapshot);
  }

  Stream<List<MySecret>>? get mySecrets {
    print(uid);
    return secretCollection
        .where('userId', isEqualTo: uid)
        .get()
        .asStream()
        .map(_mySecretListFromSnapshot);
  }
}
