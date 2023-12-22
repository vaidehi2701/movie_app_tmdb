export 'package:flutter/material.dart';

//Utils
export 'package:movie_app/utils/api_base.dart';
export 'package:movie_app/utils/constant_values.dart';
export 'package:movie_app/utils/app_colors.dart';
export 'package:movie_app/utils/cm.dart';

//packages
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:responsive_sizer/responsive_sizer.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:hive_flutter/hive_flutter.dart';
export 'package:movie_app/utils/hive_adapter.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:fade_shimmer/fade_shimmer.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';

//Home Screen
export 'package:movie_app/feature/home/bloc/home_state.dart';
export 'package:movie_app/feature/home/bloc/home_bloc.dart';
export 'package:movie_app/feature/home/bloc/home_event.dart';
export 'package:movie_app/feature/home/data/home_repository.dart';
export 'package:movie_app/feature/home/model/movie_model.dart';
export 'package:movie_app/feature/home/widgets/movie_slider.dart';
export 'package:movie_app/feature/home/widgets/movie_list.dart';
export 'package:movie_app/feature/home/screens/home_screen.dart';

//Detail Screen
export 'package:movie_app/feature/detail/screens/detail_screen.dart';
export 'package:movie_app/feature/detail/bloc/favourite_bloc.dart';
export 'package:movie_app/feature/detail/bloc/favourite_state.dart';
export 'package:movie_app/feature/detail/widgets/bottom_buttons.dart';
export 'package:movie_app/feature/detail/widgets/movie_description.dart';
export 'package:movie_app/feature/detail/widgets/top_view.dart';
export 'package:movie_app/feature/detail/bloc/favourite_event.dart';
