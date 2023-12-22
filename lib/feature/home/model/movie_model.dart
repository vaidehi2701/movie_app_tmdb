class MovieModel {
  String title;
  int id;
  String backDropPath;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  MovieModel({
    required this.title,
    required this.id,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json["title"] ?? '',
      id: json["id"] ?? 0,
      backDropPath: json["backdrop_path"] ?? '',
      overview: json["overview"] ?? '',
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] ?? '',
      voteAverage: json["vote_average"].toDouble() ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "id": id,
      "backdrop_path": backDropPath,
      "overview": overview,
      "poster_path": posterPath,
      "release_date": releaseDate,
      "vote_average": voteAverage,
    };
  }
}
