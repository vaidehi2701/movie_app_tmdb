import 'package:movie_app/utils/export_files.dart';

class TopView extends StatelessWidget {
  final MovieModel movie;
  const TopView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Stack(
        children: [
          SizedBox(
            height: 40.h,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: dotenv.env['imageBaseUrl']! + movie.backDropPath,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  FadeShimmer(
                width: 12.w,
                height: 40.h,
                highlightColor: const Color(0xff22272f),
                baseColor: const Color(0xff20252d),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 4.h,
            left: 5.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greyColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 26.h,
            left: 5.w,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(strokeAlign: 2.sp, color: Colors.white)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 20.h,
                    width: 30.w,
                    child: CachedNetworkImage(
                      imageUrl: dotenv.env['imageBaseUrl']! + movie.posterPath,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => FadeShimmer(
                        width: 30.w,
                        height: 20.h,
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
            ),
          ),
          Positioned(
            top: 42.h,
            right: 3.w,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.sp),
                  color: AppColors.whiteBgColor.withOpacity(0.5)),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 3.sp),
                child: Row(
                  children: [
                    SizedBox(
                        height: 4.h,
                        width: 4.w,
                        child: SvgPicture.asset(ImageConstants.starIcon)),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      movie.voteAverage == 0.0
                          ? 'N/A'
                          : movie.voteAverage.toStringAsFixed(2),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
