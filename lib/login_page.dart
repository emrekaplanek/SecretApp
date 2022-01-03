import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:secret/provider/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          icon: const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
          label: const Text('Sign Up')),
    );
  }
}
