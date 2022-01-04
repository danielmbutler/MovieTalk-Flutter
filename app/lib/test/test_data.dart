import 'package:app/models/movie.dart';

class TestData {
  static Movie movie = Movie(
    "Spider-Man: Homecoming",
    "Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges.",
     7.5,
    "https://image.tmdb.org/t/p/w500/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg"
  );

  static List<Movie> getMovies(){
    List<Movie> movies = List.empty(growable: true);

    for(var i = 0; i < 4; i++ ){
      movies.add(TestData.movie);
    }
    return movies;
  }
}