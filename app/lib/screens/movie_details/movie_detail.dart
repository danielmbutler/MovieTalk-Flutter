import 'package:app/models/movie.dart';
import 'package:app/screens/shared/custom_scaffold.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        movie.title!,
        <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(Constants.imgUrl + movie.img!),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Rating : " + movie.rating.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                movie.overview!,
                style: TextStyle(color: Colors.grey[700]),
              )),
        ],
        null,
        true);
  }
}
