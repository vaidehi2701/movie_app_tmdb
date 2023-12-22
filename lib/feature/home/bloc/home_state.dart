import 'package:movie_app/feature/home/model/movie_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class MovieSuccessState extends HomeState {
  final List<MovieModel> trending;
  final List<MovieModel> popular;
  final List<MovieModel> upcoming;
  final List<MovieModel> topRated;

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
