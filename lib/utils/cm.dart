import 'package:movie_app/utils/export_files.dart';

callNextScreen(BuildContext context, Widget screenName) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screenName));
}

//method for displaying each first letter of word with different color
List<TextSpan> buildTextSpans(String title) {
  List<String> words = title.split(' ');

  List<TextSpan> textSpans = [];

  for (int i = 0; i < words.length; i++) {
    String word = words[i];

    TextSpan textSpan = TextSpan(
      text: word.substring(0, 1),
      style: TextStyle(
        color: AppColors.yellowColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    textSpans.add(textSpan);

    if (i < words.length - 1) {
      textSpans.add(TextSpan(
          text: "${word.substring(1)} ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          )));
    } else {
      textSpans.add(TextSpan(
          text: word.substring(1),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          )));
    }
  }

  return textSpans;
}
