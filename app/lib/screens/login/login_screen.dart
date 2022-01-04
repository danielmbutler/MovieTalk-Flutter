import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/login_box.dart';
import 'widgets/server_status.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(widget.title, <Widget>[
      ServerStatus("online", true),
      Expanded(
        child: LoginBox(),
      )
    ], null);
  }
}
