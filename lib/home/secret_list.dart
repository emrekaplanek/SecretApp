import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:secret/models/secret.dart';

class SecretList extends StatefulWidget {
  const SecretList({Key? key}) : super(key: key);

  @override
  _SecretListState createState() => _SecretListState();
}

class _SecretListState extends State<SecretList> {
  @override
  Widget build(BuildContext context) {
    final secrets = Provider.of(context)<List<Secret>>(context);

    secrets.forEach((secret) {
      print(secret.sContext);
    });
    return Container();
  }
}
