import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/utils/export.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.movieData,
  });

  final List<Movie> movieData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
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
                      '${ApiUrls.imageBaseUrl}${movieData[itemIndex].posterPath}',
                  progressIndicatorBuilder:
                      (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
