import 'package:app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

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


