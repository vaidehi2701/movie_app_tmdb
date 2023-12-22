import 'dart:convert';

import 'package:movie_app/utils/export.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  //ApiUrls.trendingMovies

  Future<List<Movie>> fetchMovies(String category) async {
    final response = await http.get(Uri.parse(category));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<List<Movie>>> fetchAllMovies() async {
    final List<Future<List<Movie>>> futures = [];

    for (String category in apiEndpoints) {
      final response = fetchMovies(category);
      futures.add(response);
    }

    try {
      final List<List<Movie>> results = await Future.wait(futures);

      return results;
    } catch (e) {
      throw Exception(e);
    }
  }

  final List<String> apiEndpoints = [
    ApiUrls.trendingMovies,
    ApiUrls.popularMovies,
    ApiUrls.upcomingMovies,
    ApiUrls.topRatedMovies,
  ];
}
