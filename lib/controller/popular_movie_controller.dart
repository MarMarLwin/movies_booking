import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:movies/data/repo/popular_movie_repo.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/models/popular_movie.dart';
import 'package:movies/models/result.dart';

class PopularMovieController extends GetxController {
  final PopularMovieRepo movieRepo;

  PopularMovieController({required this.movieRepo});

  late List<Results> _moviesList = [];

  List<Results> get movieList => _moviesList;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> getPopularMovieList() async {
    _isLoading = true;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Response response = await movieRepo.getPopularMovies();

      if (response.statusCode == 200) {
        _moviesList = [];

        /*var data = PopularMovie.fromJson(response.body);

        data.toJson().forEach((key, value) {
          _moviesList.add(CurrencyRate(key, value));
        });*/
        var data = PopularMovie.fromJson(response.body).results;
      _moviesList.addAll(data);

      }
    }
    _isLoading = false;
    update();
  }
}


