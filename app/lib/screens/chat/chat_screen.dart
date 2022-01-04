import 'package:app/models/movie.dart';
import 'package:app/screens/chat/widgets/message_box.dart';
import 'package:app/screens/movie_details/movie_detail.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Movie movie;

  ChatScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        movie.title, <Widget>[Expanded(child: Container()), MessageBox()], navigateToMovieDetails(context));
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
