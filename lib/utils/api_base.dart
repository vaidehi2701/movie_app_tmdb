class ApiUrls {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/original/";
  static const apiKey = "c3f030a72294caf3cfbc0675e82aa176";

  static const trendingMovies = "${baseUrl}trending/movie/day?api_key=$apiKey";
  static const popularMovies = "${baseUrl}movie/popular?api_key=$apiKey";
  static const upcomingMovies = "${baseUrl}movie/upcoming?api_key=$apiKey";
  static const topRatedMovies = "${baseUrl}movie/top_rated?api_key=$apiKey";
}
