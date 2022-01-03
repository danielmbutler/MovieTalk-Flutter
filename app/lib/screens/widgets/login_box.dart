import 'package:app/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBox extends StatefulWidget {
  LoginBox();

  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/movie_reel.png', height: 80, width: 80),
        const Text(
          "Movie Talk",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontFamily: 'Notable'),
        ),
        const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            )),
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              )),
        ),
        TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: login,
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ) )
      ],
    );
  }

  void login(){
    ViewUtils.showSnackBar(context, "Logging In .....");
  }
}
