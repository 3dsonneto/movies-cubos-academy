class Movie {
  String poster_path;
  String release_date;
  String title;

  Movie.fromJson(Map<String, dynamic> json) {
    poster_path = json["poster_path"];
    release_date = json["release_date"];
    title = json["title"];
  }
}
