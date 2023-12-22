import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/utils/export.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.movieList,
  });
  final List<Movie> movieList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      movie: movieList[index],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.sp),
                child: SizedBox(
                  height: 70.h,
                  width: 35.w,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiUrls.imageBaseUrl}${movieList[index].posterPath}',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Padding(
                      padding: EdgeInsets.all(0.sp),
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
