import 'package:app/models/movie.dart';
import 'package:app/screens/chat/chat_screen.dart';
import 'package:app/utils/constants.dart';
import 'package:app/viewmodels/movie_list_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatefulWidget {
  final List<Movie> movies;
  final String currentUserId;

  ChatList(this.movies, this.currentUserId);

  @override
  _ChatListState createState() => _ChatListState(this.movies);
}

class _ChatListState extends State<ChatList> {

  final List<Movie> movies;

  _ChatListState(this.movies);




  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index];
          var image = movie.img;

          return Card(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: Constants.imgUrl + image!,
                height: 50,
                width: 50,
              ),
              title: Text(movie.title!),
              subtitle: Text("Latest Message"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return ChatScreen(movie, widget.currentUserId);
                  },
                ));
              },
            ),
          );
        });
  }

}
