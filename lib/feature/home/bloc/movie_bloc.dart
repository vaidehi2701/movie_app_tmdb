import 'package:movie_app/utils/export.dart';

class HomeBloc extends Bloc<Homeevent, HomeState> {
  HomeRepository movieRepository;
  HomeBloc({required this.movieRepository}) : super(HomeInitialState()) {
    on<Homeevent>((event, emit) async {
      if (event is FetchMoviesEvent) {
        emit(HomeLoadingState());
        try {
          final List<List<Movie>> moviesByCategory =
              await movieRepository.fetchAllMovies();

          emit(MovieSuccessState(
              trending: moviesByCategory[0],
              popular: moviesByCategory[1],
              upcoming: moviesByCategory[2],
              topRated: moviesByCategory[3]));
        } catch (e) {
          emit(MovieErrorState('Failed to load movies'));
        }
      }
    });
  }
}
