import 'package:app/models/Message.dart';
import 'package:app/models/movie.dart';

import 'package:app/screens/chat/widgets/message_list.dart';
import 'package:app/screens/movie_details/movie_detail.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:app/viewmodels/message_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Movie movie;
  final String currentUserId;
  final String username;
  final List<Message> messages;
  final Function sendMessage;

  ChatScreen(this.movie, this.currentUserId, this.messages, this.sendMessage, this.username);




  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
        movie.title!, <Widget>[Expanded(
    child:MessageList(
        currentUserId,
        messages,
        sendMessage,
        movie.id,
        username
    )
    )],
        navigateToMovieDetails(context), true);
  }

  Widget navigateToMovieDetails(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.movie),
        tooltip: 'Go to movie details',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return MovieDetail(movie);
            },
          ));
        });
  }
}
