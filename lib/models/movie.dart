import 'package:floor/floor.dart';

@entity
class Movie {
  Movie({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.isFav,
  });
  late final String adult;
  late final String backdropPath;
  @primaryKey
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final String popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final String video;
  late final String voteAverage;
  late final int voteCount;
  late int isFav = 0;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'].toString();
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'].toString();
    posterPath = 'https://image.tmdb.org/t/p/w200${json['poster_path']}';
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'].toString();
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    _data['isFav'] = isFav;
    return _data;
  }
}
