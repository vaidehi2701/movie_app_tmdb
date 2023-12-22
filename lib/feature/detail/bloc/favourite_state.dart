import 'package:movie_app/utils/export_files.dart';

abstract class FavouriteState {}

class FavouriteInitialState extends FavouriteState {}

class FavoriteMovieState {
  final List<MovieModel> favorites;

  const FavoriteMovieState(this.favorites);
}
class FavouriteSuccessState extends FavouriteState {}
