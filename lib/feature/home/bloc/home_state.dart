import 'package:movie_app/feature/home/model/movie_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class MovieSuccessState extends HomeState {
  final List<Movie> trending;
  final List<Movie> popular;
  final List<Movie> upcoming;
  final List<Movie> topRated;

  MovieSuccessState(
      {required this.trending,
      required this.popular,
      required this.upcoming,
      required this.topRated});
}

class MovieErrorState extends HomeState {
  final String error;

  MovieErrorState(this.error);
}
