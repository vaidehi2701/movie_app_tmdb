import 'package:movie_app/utils/export_files.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository movieRepository;
  HomeBloc({required this.movieRepository}) : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchMoviesEvent) {
        emit(HomeLoadingState());
        try {
          final List<List<MovieModel>> moviesByCategory =
              await movieRepository.fetchAllMovies();

          emit(MovieSuccessState(
              trending: moviesByCategory[0],
              popular: moviesByCategory[1],
              upcoming: moviesByCategory[2],
              topRated: moviesByCategory[3]));
        } catch (e) {
          emit(MovieErrorState(e.toString()));
        }
      }
    });
  }
}
