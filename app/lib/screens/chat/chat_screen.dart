import 'package:app/models/movie.dart';

import 'package:app/screens/chat/widgets/message_list.dart';
import 'package:app/screens/movie_details/movie_detail.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:app/viewmodels/message_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final Movie movie;
  final String currentUserId;

  ChatScreen(this.movie, this.currentUserId);


  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
        movie.title!, <Widget>[Expanded(child:  ChangeNotifierProvider(
        create: (_) => MessageListViewModel(),
    child:MessageList(currentUserId)))], navigateToMovieDetails(context), true);
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
