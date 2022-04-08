import 'package:get/get.dart';
import 'package:movies/data/api/apiClient.dart';
import 'package:movies/utils/app_constants.dart';

class PopularMovieRepo extends GetxService {
  final ApiClient apiClient;

  PopularMovieRepo({required this.apiClient});

  Future<Response> getPopularMovies() async {
    return await apiClient.getPopularMovies(AppConstant.popularMoviesLink);
  }
}
