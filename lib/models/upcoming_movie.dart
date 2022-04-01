
import 'package:movies/models/result.dart';

import 'movie_date.dart';

class UpcomingMovie {
  UpcomingMovie({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final Dates dates;
  late final int page;
  late final List<Results> results;
  late final int totalPages;
  late final int totalResults;

  UpcomingMovie.fromJson(Map<String, dynamic> json) {
    dates = Dates.fromJson(json['dates']);
    page = json['page'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dates'] = dates.toJson();
    _data['page'] = page;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}
