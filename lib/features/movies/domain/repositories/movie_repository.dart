import 'dart:convert';

import 'package:user_app/features/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String apikey = '9a86f87e33e889c4aa3e273cd0070462';
  final String movieUrlpart1 =
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&page=';

  final String movieUrlpart2 = '&api_key=9a86f87e33e889c4aa3e273cd0070462';
  Future<List<MovieModel>> fetchMovies(int pagenumber) async {
    final response = await http.get(Uri.parse(movieUrlpart1+pagenumber.toString()+movieUrlpart2));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List movies = data["results"];
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load Movies");
    }
  }
}
