import 'package:movie_app/utils/export_files.dart';

class MovieDescription extends StatelessWidget {
  final MovieModel movie;
  const MovieDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Row(
                children: [
                  SizedBox(
                      height: 5.h,
                      width: 5.w,
                      child: SvgPicture.asset(
                        ImageConstants.calenderIcon,
                        colorFilter: const ColorFilter.mode(
                            AppColors.whiteColor, BlendMode.srcIn),
                      )),
                  SizedBox(
                    width: 2.w,
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
          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
      ],
    );
  }
}
