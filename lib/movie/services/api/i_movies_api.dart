import '../../entity/movie_entity.dart';

abstract class IMoviesApi {
  Future<List<MovieEntity>> getMovies();
}

abstract class IMoviesApiException implements Exception {
  const IMoviesApiException([this.message]);

  final String? message;

  @override
  String toString() {
    String result = 'IMoviesApiExceptionl';
    if (message is String) return '$result: $message';
    return result;
  }
}
