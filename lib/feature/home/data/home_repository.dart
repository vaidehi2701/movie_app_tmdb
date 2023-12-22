import 'package:movie_app/utils/export_files.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomeRepository {
  final String cacheKey = 'movie_cache_key';

  //To fetch Single Category from movie
  Future<List<MovieModel>> fetchMovies(String category) async {
    final response = await http.get(Uri.parse(category));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  //To fetch all Categories's Movie
  Future<List<List<MovieModel>>> fetchAllMovies() async {
    final List<Future<List<MovieModel>>> futures = [];
    final List<String> apiEndpoints = [
      ApiUrls.trendingMovies,
      ApiUrls.popularMovies,
      ApiUrls.upcomingMovies,
      ApiUrls.topRatedMovies,
    ];

    for (String category in apiEndpoints) {
      final response = fetchMovies(category);
      futures.add(response);
    }

    try {
      final List<List<MovieModel>> results = await Future.wait(futures);

      // Cache the results
      final jsonResult = results
          .map((movies) => movies.map((movie) => movie.toJson()).toList())
          .toList();

      await DefaultCacheManager().putFile(
          cacheKey, Uint8List.fromList(utf8.encode(json.encode(jsonResult))));

      return results;
    } catch (e) {
      // Try to retrieve data from cache in case of an error
      var file = await DefaultCacheManager().getFileFromCache(cacheKey);
      if (file != null) {
        final cachedData = await file.file.readAsString();
        final decodedData = json.decode(cachedData);
        return decodedData
            .map<List<MovieModel>>((data) => data
                .map<MovieModel>((movie) => MovieModel.fromJson(movie))
                .toList())
            .toList();
      }
      throw Exception(e);
    }
  }
}
