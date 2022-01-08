import 'package:flutter/widgets.dart';

import '../secret_list.dart';

class AllSecretsTab extends StatefulWidget {
  const AllSecretsTab({Key? key}) : super(key: key);

  @override
  _AllSecretsTabState createState() => _AllSecretsTabState();
}

class _AllSecretsTabState extends State<AllSecretsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(child: SecretList(type: 'all')),
        ],
      ),
    );
  }
}
