class AppConstant{
  static const String appName = 'Movies';
  static const String apiKey = '81c100db66f0bd4548632d68d8e80860';

   static const String appBaseUrl = 'https://api.themoviedb.org/3/movie';
  static const String popularMoviesLink = '/popular?api_key=$apiKey';
  static const String upcomingMoviesLink='/upcoming?api_key=$apiKey';
  static const String imageInitUrl='https://image.tmdb.org/t/p/w200';
  static const String databaseName = 'movies.db';
}
