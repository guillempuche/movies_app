import 'package:bloc_test/bloc_test.dart';
import 'package:movies_app/movie/services/api/tmdb_movies_api.dart';
import 'package:movies_app/movie/services/bloc/movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

class MockingTmdbMoviesApi extends Mock implements TmdbMoviesApi {}

void main() {
  group('MoviesBloc', () {
    late TmdbMoviesApi tmdbMoviesApi;

    setUp(() {
      tmdbMoviesApi = MockingTmdbMoviesApi();
    });

    test('initial state is MoviesFetchInProgress', () {
      expect(
          MoviesBloc(moviesApi: tmdbMoviesApi).state, MoviesFetchInProgress());
    });

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesFetchInProgress, MoviesFetchSuccess]',
      setUp: () {
        when(tmdbMoviesApi.getMovies).thenAnswer((_) async => mockItems);
      },
      build: () => MoviesBloc(moviesApi: tmdbMoviesApi),
      act: (bloc) => bloc.add(MoviesFetchingStarted()),
      expect: () => <MoviesState>[
        MoviesFetchInProgress(),
        const MoviesFetchSuccess(mockItems)
      ],
      verify: (_) => verify(tmdbMoviesApi.getMovies).called(1),
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesFetchInProgress, MoviesFetchFailure]',
      setUp: () {
        when(tmdbMoviesApi.getMovies).thenThrow('error message');
      },
      build: () => MoviesBloc(moviesApi: tmdbMoviesApi),
      act: (bloc) => bloc.add(MoviesFetchingStarted()),
      expect: () => <MoviesState>[
        MoviesFetchInProgress(),
        const MoviesFetchFailure('error message')
      ],
      verify: (_) => verify(tmdbMoviesApi.getMovies).called(1),
    );

    blocTest<MoviesBloc, MoviesState>(
      'emit [MoviesSelectMovie]',
      build: () => MoviesBloc(moviesApi: tmdbMoviesApi),
      act: (bloc) => bloc.add(MoviesOneSelected(mockItems[0])),
      expect: () => <MoviesState>[MoviesSelectMovie(mockItems[0])],
    );
  });
}
