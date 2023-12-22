import 'package:movie_app/feature/home/widgets/custom_textfield.dart';
import 'package:movie_app/utils/export_files.dart';

class CategoryFullScreen extends StatefulWidget {
  final List<MovieModel> movieList;
  final String categoryName;
  const CategoryFullScreen(
      {super.key, required this.movieList, required this.categoryName});

  @override
  State<CategoryFullScreen> createState() => _CategoryFullScreenState();
}

class _CategoryFullScreenState extends State<CategoryFullScreen> {
  List<MovieModel> results = [];
  @override
  void initState() {
    super.initState();
    results = List.from(widget.movieList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            CustomSearchField(onChanged: (val) {
              {
                setState(() {
                  results = widget.movieList
                      .where((string) => string.title
                          .toLowerCase()
                          .contains(val.toLowerCase()))
                      .toList();
                });
              }
            }),
            SizedBox(
              height: 2.h,
            ),
            results.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 120.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.face_retouching_natural_rounded,
                          color: AppColors.whiteColor,
                        ),
                        Text(
                          "  No Data Found",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 1.h,
                      ),
                      itemCount: results.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.sp),
                            child: CachedNetworkImage(
                              height: 13.h,
                              width: 40.w,
                              imageUrl: dotenv.env['imageBaseUrl']! +
                                  results[index].posterPath,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      FadeShimmer(
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
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  results[index].title,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(results[index].releaseDate.split('-')[0]),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
