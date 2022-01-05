import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secret/services/database.dart';
import 'package:secret/shared/constants.dart';

class NewSecret extends StatefulWidget {
  const NewSecret({Key? key}) : super(key: key);

  @override
  _NewSecretState createState() => _NewSecretState();
}

class _NewSecretState extends State<NewSecret> {
  final _formKey = GlobalKey<FormState>();
  late String _currentTitle;
  late String _currentContent;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Text(
            "Share your secret with me!",
            style: TextStyle(fontSize: 18, color: Colors.deepPurple),
          ),
          SizedBox(height: 20),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontFamily: 'AvenirLight'),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: new UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purpleAccent, width: 1.0)),
              ),
              validator: (val) {
                if (val!.isEmpty) return 'please enter a title';
              },
              onChanged: (val) => setState(() {
                    _currentTitle = val;
                  })),
          SizedBox(height: 20),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'Content',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontFamily: 'AvenirLight'),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: new UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purpleAccent, width: 1.0)),
              ),
              validator: (val) {
                if (val!.isEmpty) return 'please enter a content';
              },
              onChanged: (val) => setState(() {
                    _currentContent = val;
                  })),
          ElevatedButton(
              child: Text(
                'Share it',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await DatabaseService(uid: user.uid)
                      .addUserSecret(_currentTitle, _currentContent);
                  Navigator.pop(context);
                }
              }),
        ]));
  }
}
