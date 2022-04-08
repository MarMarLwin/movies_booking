import 'package:get/get.dart';
import 'package:movies/pages/movies/popular_movies_deail.dart';
import 'package:movies/pages/movies/recommended_movies_detail.dart';

class RouteHelper {
  static String initial = '/';
  static String popularMovie='/popular_movie';
  static String recommendedMovie='/recommendedMovie';
  static String getInitial()=>initial;
  static String getPopularMovie(int movieId)=>'$popularMovie?movieId=$movieId';
  static List<GetPage> routes = [
    GetPage(
        name: popularMovie,
        page: () {
          var movieId=Get.parameters['movieId'];
          return  PopularMovieDetail(movieId: int.parse(movieId!));
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000)),
    GetPage(
        name: recommendedMovie,
        page: () =>const RecommendedMovieDetail(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000))
  ];
}
