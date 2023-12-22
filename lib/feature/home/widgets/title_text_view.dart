import 'package:movie_app/feature/home/screens/category_full_screen.dart';
import 'package:movie_app/utils/export_files.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final List<MovieModel> movieList;
  const CustomTitle({super.key, required this.title, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 3.w, bottom: 0.5.h),
      child: GestureDetector(
        onTap: () {
          callNextScreen(
            context,
            CategoryFullScreen(
              categoryName: title,
              movieList: movieList,
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: buildTextSpans(title)),
            ),
            SizedBox(
              width: 2.w,
            ),
            SizedBox(
                height: 4.h,
                width: 4.w,
                child: SvgPicture.asset(ImageConstants.rightArrowIcon))
          ],
        ),
      ),
    );
  }
}
