import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  final Widget? action;
  final bool backButton;

  CustomScaffold(this.title, this.widgets, this.action, this.backButton);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        actions: action != null ? <Widget>[action!] : <Widget>[],
        automaticallyImplyLeading: backButton,
      ),
      body: SafeArea(
          child: Column(
        children: widgets,
      )),
    );
  }
}