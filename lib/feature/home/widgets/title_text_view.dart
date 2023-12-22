import 'package:movie_app/utils/export.dart';

class TitleTextView extends StatelessWidget {
  final String title;
  const TitleTextView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, left: 3.w),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
      ),
    );
  }
}
