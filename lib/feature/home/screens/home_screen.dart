import 'package:movie_app/feature/home/widgets/title_text_view.dart';
import 'package:movie_app/utils/export_files.dart';

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
  List<MovieModel> trendingMovie = [];
  List<MovieModel> popularMovie = [];
  List<MovieModel> upComingMovie = [];
  List<MovieModel> topRatedMovie = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.bgColor,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is MovieSuccessState) {
            trendingMovie = state.trending;
            popularMovie = state.popular;
            upComingMovie = state.upcoming;
            topRatedMovie = state.topRated;
          }
          if (state is MovieErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
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
                  SizedBox(height: kToolbarHeight - 10.sp),
                  SizedBox(
                    height: kToolbarHeight,
                    child: Center(
                      child: Image.asset(ImageConstants.appLogo),
                    ),
                  ),
                  CustomTitle(
                      title: StringConstants.trendingMovies,
                      movieList: trendingMovie),
                  MovieSlider(
                    movieData: trendingMovie,
                  ),
                  CustomTitle(
                      title: StringConstants.popular, movieList: popularMovie),
                  MoviesList(
                    movieList: popularMovie,
                  ),
                  CustomTitle(
                      title: StringConstants.upComing,
                      movieList: upComingMovie),
                  MoviesList(
                    movieList: upComingMovie,
                  ),
                  CustomTitle(
                      title: StringConstants.topRated,
                      movieList: topRatedMovie),
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
