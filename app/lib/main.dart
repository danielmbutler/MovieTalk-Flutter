import 'package:app/screens/login/login_screen.dart';
import 'package:app/viewmodels/message_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieTalk',
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'OpenSans'
      ),
      home: LoginScreen(title: 'MovieTalk'),
    );
  }
}


