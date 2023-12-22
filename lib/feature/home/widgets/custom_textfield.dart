import 'package:movie_app/utils/export_files.dart';

class CustomSearchField extends StatelessWidget {
  final Function(String) onChanged;
  const CustomSearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(
        color: AppColors.greyColor,
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.sp),
        filled: true,
        fillColor: const Color(0xfff1f1f1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: "Search...",
        hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            decorationThickness: 6),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: Colors.black,
      ),
    );
  }
}
