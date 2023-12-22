import 'package:movie_app/utils/export_files.dart';

abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final MovieModel movie;

  AddFavoriteEvent({required this.movie});
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final MovieModel movie;

  RemoveFavoriteEvent({required this.movie});
}
