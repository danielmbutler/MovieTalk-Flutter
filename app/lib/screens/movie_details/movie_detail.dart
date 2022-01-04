import 'package:app/models/movie.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(movie.title, <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(movie.img),
          ),
        ),
      )
    ], null);
  }
}