import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:app/models/movie.dart';
import 'package:app/screens/chat_list/widgets/chat_list.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:app/utils/view_utils.dart';
import 'package:app/viewmodels/movie_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {

  final String currentUserId;
  final List<Movie> movies;

  ChatListScreen(this.currentUserId, this.movies);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
        "Chats",
        <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          ),
          Expanded(child: ChatList(widget.movies, widget.currentUserId)),
        ],
        logout(context), false);
  }
}



Widget logout(BuildContext context) {


  Future<void> performLogout() async {
    try {
      ViewUtils.showSnackBar(context, "Logging Out");
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      ViewUtils.showSnackBar(context, e.message);
    }

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ));
  }


  return IconButton(
      icon: const Icon(Icons.logout),
      tooltip: 'Go to movie details',
      onPressed: () async {

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title:  Text('Are you sure?'),
              content:  Text('Do you want to Logout'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child:  Text('No'),
                ),
                TextButton(
                  onPressed: () => performLogout(),
                  child:  Text('Yes'),
                ),
              ],
            ),
          );
      });

}

