import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static String trendingMovies =
      "${dotenv.env["baseUrl"]}trending/movie/day?api_key=${dotenv.env["apiKey"]}";
  static String popularMovies =
      "${dotenv.env["baseUrl"]}movie/popular?api_key=${dotenv.env["apiKey"]}";
  static String upcomingMovies =
      "${dotenv.env["baseUrl"]}movie/upcoming?api_key=${dotenv.env["apiKey"]}";
  static String topRatedMovies =
      "${dotenv.env["baseUrl"]}movie/top_rated?api_key=${dotenv.env["apiKey"]}";
}
