import 'package:amplify_flutter/amplify.dart';
import 'package:app/models/movie.dart';
import 'package:flutter/cupertino.dart';

class MovieListViewModel with ChangeNotifier{

 Future<List<Movie>?> getMovies() async {
    try {
      var movies =  await Amplify.DataStore.query(Movie.classType);
      debugPrint(movies.toString());
      return movies;
   } on Exception catch (e) {

      debugPrint(e.toString());
     return null;
   }
 }


}