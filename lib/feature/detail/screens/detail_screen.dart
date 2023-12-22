import 'package:movie_app/utils/export_files.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final favoriteBox = Hive.box<Movie>('favorites');
    return BlocProvider(
      create: (context) => FavoriteBloc(favoriteBox),
      child: DetailScreenUI(movie: movie),
    );
  }
}

class DetailScreenUI extends StatelessWidget {
  const DetailScreenUI({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopView(movie: movie),
              MovieDescription(movie: movie),
              BottomButtons(
                movie: movie,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SetAppBar extends StatelessWidget {
  final String title;
  const SetAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          const SizedBox.shrink()
        ],
      ),
    );
  }
}
