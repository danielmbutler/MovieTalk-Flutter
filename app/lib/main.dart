
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/viewmodels/movie_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  initState() {
    super.initState();
    if(!Amplify.isConfigured) {
      _configureAmplify();
      setState(() {});
      return;
    }
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyDataStore datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([authPlugin, datastorePlugin, AmplifyAPI()]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieTalk',
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'OpenSans'
      ),
      home:  MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => MovieListViewModel(),
        ),
      ], child:LoginScreen()
    ));
  }
}



