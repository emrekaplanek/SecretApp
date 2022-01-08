import 'package:flutter/material.dart';
import 'package:secret/models/mySecret.dart';
import 'package:secret/models/secret.dart';

class MySecretTile extends StatelessWidget {
  final MySecret mySecret;
  const MySecretTile({Key? key, required this.mySecret}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.deepPurple,
          ),
          title: Text(mySecret.title.toString()),
          subtitle: Text(mySecret.sContext.toString()),
          trailing: Icon(Icons.delete),
        ),
      ),
    );
  }
}
