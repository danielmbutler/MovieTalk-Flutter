import 'package:app/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  Message(
      {required this.text, required this.isCurrentUser, required this.time, required this.username});

  final String text;
  final String time;
  final String username;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // add some padding
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.red : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                username,
                style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                text,
                style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:2, right: 6, bottom: 6),
              child: Text(
                time,
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12,
                    color: isCurrentUser ? Colors.white : Colors.black),
              ),
            )
          ]),
        ),
      ),
    );
  }
  static Message createMessage(String message ){
    return Message(text: message, isCurrentUser: true, time: ViewUtils.getCurrentTime(), username: "username");
  }
}
