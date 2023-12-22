import 'package:movie_app/utils/export_files.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.movieList,
  });
  final List<MovieModel> movieList;
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
                        '${dotenv.env['imageBaseUrl']}${movieList[index].posterPath}',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => FadeShimmer(
                      width: 12.w,
                      height: 40.h,
                      highlightColor: const Color(0xff22272f),
                      baseColor: const Color(0xff20252d),
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
