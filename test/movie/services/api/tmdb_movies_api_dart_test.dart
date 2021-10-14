@Skip('Don\'t know how to approach it')

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app/movie/services/api/tmdb_movies_api.dart';

// Real class
class MockTmdbMoviesApi extends Mock implements TmdbMoviesApi {}

void main() {
  group('TmdbMoviesApi', () {
    late MockTmdbMoviesApi tmdbMoviesApi;
    setUp(() => {
          // tmdbApiMock = MockTmdbMoviesApi();
        });
    test('getMovies()', () {});
  });
}
