import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:movies_cubos/movie.dart';

class API {
  final authority = "api.themoviedb.org";
  final path = "/3/movie/upcoming?";
  final keyParameter = "&api_key=a5bc05fb630c9b7fdc560033345fa13e";

  Future<Movie> fetchMovie() async {
    final response =
        await http.get(Uri.https(authority, "${path}/${keyParameter}"));

    if (response.statusCode == 200) {
      print(response);
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Error");
    }
  }
}
