import 'package:movie_app/utils/export_files.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.movieData,
  });

  final List<MovieModel> movieData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: movieData.isNotEmpty
            ? CarouselSlider.builder(
                itemCount: movieData.length,
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  viewportFraction: 0.55,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            movie: movieData[itemIndex],
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 300,
                        width: 200,
                        child: CachedNetworkImage(
                          imageUrl:
                              '${dotenv.env['imageBaseUrl']}${movieData[itemIndex].posterPath}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => FadeShimmer(
                            width: 12.w,
                            height: 40.h,
                            highlightColor: const Color(0xff22272f),
                            baseColor: const Color(0xff20252d),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const SizedBox.shrink());
  }
}
