import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/export.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: ApiUrls.imageBaseUrl + movie.backDropPath,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
                          opacity: 0.5,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            border: Border.all(
                                strokeAlign: 2.sp, color: Colors.white)),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              height: 20.h,
                              width: 30.w,
                              child: CachedNetworkImage(
                                imageUrl:
                                    ApiUrls.imageBaseUrl + movie.posterPath,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.whiteBgColor),
                        child: Row(
                          children: [
                            const Icon(Icons.star),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              movie.voteAverage == 0.0
                                  ? 'N/A'
                                  : movie.voteAverage.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          movie.releaseDate.split('-')[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  movie.overview,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteBgColor,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Favourite",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.share),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
          IconButton(
            onPressed: () {
              // Get.find<MoviesController>().addToWatchList(movie);
            },
            icon: const Icon(Icons.bookmark),
            // icon: Obx(
            //   () =>
            //       Get.find<MoviesController>().isInWatchList(movie)
            //           ? const Icon(
            //               Icons.bookmark,
            //               color: Colors.white,
            //               size: 33,
            //             )
            //           : const Icon(
            //               Icons.bookmark_outline,
            //               color: Colors.white,
            //               size: 33,
            //             ),
            // ),
          ),
        ],
      ),
    );
  }
}
