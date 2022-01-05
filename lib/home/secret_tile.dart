import 'package:flutter/material.dart';
import 'package:secret/models/secret.dart';

class SecretTile extends StatelessWidget {
  final Secret secret;
  const SecretTile({Key? key, required this.secret}) : super(key: key);
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
          title: Text(secret.title.toString()),
          subtitle: Text(secret.sContext.toString()),
        ),
      ),
    );
  }
}
