class Movie {
  List<MovieResults> results;

  Movie.fromJson(Map<String, dynamic> json) {
    var resultsArray = json["results"] as List;

    results = resultsArray.map((item) {
      return MovieResults.fromJson(item);
    }).toList();
  }
}

class MovieResults {
  String posterPath;
  String releaseDate;
  String title;

  MovieResults.fromJson(Map<String, dynamic> json) {
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
  }
}
