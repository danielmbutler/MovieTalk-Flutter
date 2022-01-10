import 'package:amplify_flutter/amplify.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/login_box.dart';
import 'widgets/server_status.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint(Amplify.isConfigured.toString());

    return CustomScaffold(
            'MovieTalk',
            <Widget>[
              ServerStatus(Amplify.isConfigured ? "online" : "offline",
                  Amplify.isConfigured),
              Expanded(child: LoginBox())
            ],
            null,
            false);
  }
}
