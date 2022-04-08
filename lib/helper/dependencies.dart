
import 'package:get/get.dart';
import 'package:movies/controller/popular_movie_controller.dart';
import 'package:movies/data/api/apiClient.dart';
import 'package:movies/data/repo/popular_movie_repo.dart';
import 'package:movies/utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.appBaseUrl));

  //repos
  Get.lazyPut(() => PopularMovieRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularMovieController(movieRepo: Get.find()));
}
