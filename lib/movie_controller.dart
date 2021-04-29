import "package:movies_cubos/movie_model.dart";
import "package:movies_cubos/movie.dart";

class MovieController {
  final model = MovieModel();

  Future<Movie> get movie => model.movie;

  loadMovies() {
    model.fetchMovie();
  }
}
