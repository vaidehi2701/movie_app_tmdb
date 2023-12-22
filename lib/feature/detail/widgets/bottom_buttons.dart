import 'package:movie_app/utils/export_files.dart';

class BottomButtons extends StatefulWidget {
  final MovieModel movie;
  const BottomButtons({super.key, required this.movie});

  @override
  State<BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  Box<Movie> favoriteBox = Hive.box<Movie>('favorites');
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    isFavorite = favoriteBox.containsKey(widget.movie.id);
    return BlocConsumer<FavoriteBloc, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteSuccessState) {
          isFavorite = favoriteBox.containsKey(widget.movie.id);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isFavorite) {
                        context
                            .read<FavoriteBloc>()
                            .add(RemoveFavoriteEvent(movie: widget.movie));
                      } else {
                        context
                            .read<FavoriteBloc>()
                            .add(AddFavoriteEvent(movie: widget.movie));
                      }
                    },
                    child: SizedBox(
                        height: 6.h,
                        width: 6.w,
                        child: SvgPicture.asset(
                          isFavorite
                              ? ImageConstants.likeFilledIcon
                              : ImageConstants.likeIcon,
                        )),
                  ),
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
                  SizedBox(
                      height: 6.h,
                      width: 6.w,
                      child: SvgPicture.asset(
                        ImageConstants.shareIcon,
                      )),
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
        );
      },
    );
  }
}
