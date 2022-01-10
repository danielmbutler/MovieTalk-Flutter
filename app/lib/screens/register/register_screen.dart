import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:app/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  bool isSignUpComplete = false;
  String email = "";
  RegisterScreen({Key? key}) : super(key: key);


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var email = "";
    var password = "";
    var code = "";



    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController confirmationCodeController = TextEditingController();

    passwordController.addListener(() {
      if (passwordController.text.length > 1) {
        password = passwordController.text.toString();
      }
    });

    emailController.addListener(() {
      if (emailController.text.length > 1) {
        email = emailController.text.toString();
      }
    });

    confirmationCodeController.addListener(() {
      if (confirmationCodeController.text.length > 1) {
        code = confirmationCodeController.text.toString();
      }
    });

    Future<void> registerUser(String email, String password) async {
      if (email.isEmpty || password.isEmpty) {
        ViewUtils.showSnackBar(context, "Please provide a email and password");
        return;
      }

      try {
        SignUpResult res = await Amplify.Auth.signUp(
          username: email,
          password: password,
        );
        setState(() {
          if (res.isSignUpComplete) {
            widget.email = email;
            widget.isSignUpComplete = true;
            ViewUtils.showSnackBar(
                context, "Please provide verification code from email");
          }
        });
      } on AuthException catch (e) {
        ViewUtils.showSnackBar(context, e.message);
      }
    }

    Future<void> verifyCode(String code, String username) async {
      try {
        SignUpResult res = await Amplify.Auth.confirmSignUp(
            username: username,
            confirmationCode: code
        );
        setState(() {
          if(res.isSignUpComplete) {
            ViewUtils.showSnackBar(
                context, "Registered");
            navigateToLogin();
          }
        });
      } on AuthException catch (e) {
        ViewUtils.showSnackBar(context, e.message);
      }
    }

    return CustomScaffold(
        "Register",
        <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/movie_reel.png',
                      height: 80, width: 80),
                  const Text(
                    "Movie Talk",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Notable'),
                  ),
                  widget.isSignUpComplete
                      ? Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 20),
                          child: TextField(
                              controller: confirmationCodeController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirmation code',
                              )),
                        )
                      : Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          )),
                    )
                  ],),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () => {  widget.isSignUpComplete
                          ?  verifyCode(code, widget.email)  : registerUser(email, password) },
                      child:  Text(
                        widget.isSignUpComplete ? "Confirm" : "Register",
                        style: TextStyle(color: Colors.white),
                      )),
                ]),
          )
        ],
        null, true);
  }

  void navigateToLogin() {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ));
  }
}
