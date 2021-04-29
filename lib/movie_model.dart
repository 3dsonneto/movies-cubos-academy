import 'package:movies_cubos/api.dart';
import 'package:movies_cubos/movie.dart';

class MovieModel {
  Future<Movie> _movie;

  Future<Movie> get movie => _movie;

  fetchMovie() {
    _movie = API().fetchMovie();
  }
}
