
import 'package:app/screens/chat_list/widgets/chat_list.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:app/test/test_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffold("Chats", <Widget>[
      const Padding(
        padding:
        EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      ),
      Expanded(child: ChatList(TestData.getMovies())),
    ], null);
  }
}