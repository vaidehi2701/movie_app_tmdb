import 'package:movie_app/utils/export.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.movieList,
  });
  final List<Movie> movieList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DetailsScreen(
                  //       movie: movie,
                  //     ),
                  //   ),
                  // );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${ApiUrls.imageBaseUrl}${movieList[index].posterPath}',
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
