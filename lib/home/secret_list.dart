import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:secret/models/secret.dart';
import 'package:secret/services/database.dart';

class SecretList extends StatefulWidget {
  const SecretList({Key? key}) : super(key: key);

  @override
  _SecretListState createState() => _SecretListState();
}

class _SecretListState extends State<SecretList> {
  @override
  Widget build(BuildContext context) {
    final secrets = Provider.of<List<Secret>>(context);
    if (secrets != null) {
      secrets.forEach((secret) {
        print(secret.sContext);
      });
    }
    return MultiProvider(providers: [
      StreamProvider<List<Secret?>?>.value(
          value: DatabaseService().secrets, initialData: null)
    ], child: Container());
  }
}
