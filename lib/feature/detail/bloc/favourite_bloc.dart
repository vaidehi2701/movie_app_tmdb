import 'package:movie_app/utils/export_files.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavouriteState> {
  final Box<Movie> favoriteBox;

  FavoriteBloc(this.favoriteBox) : super(FavouriteInitialState()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is AddFavoriteEvent) {
        favoriteBox.put(event.movie.id, Movie(id: event.movie.id));
        emit(FavouriteSuccessState());
      } else if (event is RemoveFavoriteEvent) {
        favoriteBox.delete(event.movie.id);
        emit(FavouriteSuccessState());
      }
    });
  }
}
