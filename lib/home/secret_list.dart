import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:secret/home/secret_tile.dart';
import 'package:secret/models/mySecret.dart';
import 'package:secret/models/secret.dart';
import 'package:secret/services/database.dart';

import 'my_secret_tile.dart';

class SecretList extends StatefulWidget {
  final type;
  SecretList({Key? key, this.type}) : super(key: key);
  @override
  _SecretListState createState() => _SecretListState();
}

class _SecretListState extends State<SecretList> {
  @override
  Widget build(BuildContext context) {
    var secrets;
    secrets = Provider.of<List<Secret>?>(context);
    if (widget.type == 'my') {
      secrets = Provider.of<List<MySecret>?>(
          context); //levent hocaya sor providerı typına göre değil adına göre nasıl çağırırım, Secret ve My secret modelinin içeriği aynı ancak providerdaki getterlerı farklı
    }

    if (secrets != null) {
      secrets.forEach((secret) {
        print(secret.sContext.toString() + "" + secret.userId);
      });
    }

    return (widget.type == 'all')
        ? ListView.builder(
            itemCount: secrets?.length,
            itemBuilder: (context, index) {
              return SecretTile(secret: secrets?[index] ?? Secret(userId: ''));
            })
        : ListView.builder(
            itemCount: secrets?.length,
            itemBuilder: (context, index) {
              return MySecretTile(
                mySecret: secrets?[index] ??
                    MySecret(
                        userId:
                            ''), //Levent Hocaya sor nasıl null kontrolü yapabilirim
              );
            });
  }
}
