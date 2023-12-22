import 'package:movie_app/feature/home/widgets/title_text_view.dart';
import 'package:movie_app/utils/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(movieRepository: HomeRepository())..add(FetchMoviesEvent()),
      child: const HomeScreenUI(),
    );
  }
}

class HomeScreenUI extends StatefulWidget {
  const HomeScreenUI({super.key});

  @override
  State<HomeScreenUI> createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  List<Movie> trendingMovie = [];
  List<Movie> popularMovie = [];
  List<Movie> upComingMovie = [];
  List<Movie> topRatedMovie = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Movie App"),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is MovieSuccessState) {
            trendingMovie = state.trending;
            popularMovie = state.popular;
            upComingMovie = state.upcoming;
            topRatedMovie = state.topRated;
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleTextView(title: 'Trending Movies'),
                  MovieSlider(
                    movieData: trendingMovie,
                  ),
                  const TitleTextView(title: 'Popular'),
                  MoviesList(
                    movieList: popularMovie,
                  ),
                  const TitleTextView(title: 'UpComing'),
                  MoviesList(
                    movieList: upComingMovie,
                  ),
                  const TitleTextView(title: 'Top Rated'),
                  MoviesList(
                    movieList: topRatedMovie,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
