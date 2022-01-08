import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret/home/new_secret.dart';
import 'package:secret/home/tabs/all_secrets_tab.dart';
import 'package:secret/home/tabs/my_secrets_tab.dart';
import 'package:secret/models/secret.dart';
import 'package:secret/provider/google_sign_in.dart';
import 'package:secret/services/database.dart';
import 'package:secret/home/secret_list.dart';

import 'models/mySecret.dart';

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

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MySecret>?>.value(
      value: DatabaseService(uid: user.uid).mySecrets,
      initialData: null,
      catchError: (_, __) => null,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                  title: Center(child: const Text('SECRET')),
                  actions: [
                    IconButton(
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.logout();
                        },
                        icon: Icon(Icons.exit_to_app))
                  ],
                  backgroundColor: Colors.purple,
                  bottom: TabBar(
                    indicatorColor: Colors.amberAccent,
                    tabs: [
                      Tab(icon: Icon(Icons.whatshot), text: 'Secrets'),
                      Tab(
                        child: Column(
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(user.photoURL!),
                              ),
                            ),
                            Text('My Secrets')
                          ],
                        ),
                      ),
                    ],
                  )),
              body: const TabBarView(
                children: [AllSecretsTab(), MySecretsTab()],
              ))),
    );
  }
}
