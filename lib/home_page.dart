import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret/home/new_secret.dart';
import 'package:secret/models/secret.dart';
import 'package:secret/provider/google_sign_in.dart';
import 'package:secret/services/database.dart';
import 'package:secret/home/secret_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    super.initState();
    cagir();
  }

  void cagir() async {
    //await DatabaseService(uid: user.uid).addUserSecret('baslik', 'oguz dene');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SECRET'),
          actions: [
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
          backgroundColor: Colors.purple,
        ),
        body: StreamProvider<List<Secret>?>.value(
            value: DatabaseService(uid: user.uid).secrets,
            initialData: null,
            catchError: (_, __) => null,
            child: Container(
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
                              onPressed: () {
                                _showSettingsPanel();
                              },
                              icon: const Icon(Icons.add_circle_rounded),
                              label: const Text('Share Secret')),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SecretList()),
                ],
              ),
            )));
  }
}
