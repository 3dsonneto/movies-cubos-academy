import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:movies_cubos/movie.dart';

class API {
  final authority = "api.themoviedb.org";
  final path = "/3/movie/upcoming";
  static const keyParameter = "a5bc05fb630c9b7fdc560033345fa13e";

  Map<String, dynamic> queryParameter = {"api_key": keyParameter};

  Future<Movie> fetchMovie() async {
    final response = await http.get(Uri.https(authority, path, queryParameter));

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      return Future.error("Error");
    }
  }
}
