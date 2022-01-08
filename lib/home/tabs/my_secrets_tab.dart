import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../new_secret.dart';
import '../secret_list.dart';

class MySecretsTab extends StatefulWidget {
  const MySecretsTab({Key? key}) : super(key: key);

  @override
  _MySecretsTabState createState() => _MySecretsTabState();
}

class _MySecretsTabState extends State<MySecretsTab> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Welcome ' + user.displayName!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      onPressed: () {
                        _showSettingsPanel();
                      },
                      icon: const Icon(Icons.add_circle_rounded),
                      label: const Text('Share Secret')),
                ),
              ),
            ],
          ),
          Expanded(child: SecretList(type: 'my')),
        ],
      ),
    );
  }

  void _showSettingsPanel() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
            child: NewSecret(),
          );
        });
  }
}
