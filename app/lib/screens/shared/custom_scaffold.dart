import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  final Widget? action;

  CustomScaffold(this.title, this.widgets, this.action);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        actions: action != null ? <Widget>[action!] : <Widget>[],
      ),
      body: SafeArea(
          child: Column(
        children: widgets,
      )),
    );
  }
}
