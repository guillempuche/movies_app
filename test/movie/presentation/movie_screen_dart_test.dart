import 'package:movies_app/movie/presentation/movie_screen.dart';
import 'package:movies_app/movie/presentation/movies_list.dart';
import 'package:movies_app/movie/services/bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';

import '../../mocks.dart';

void main() {
  late MoviesBloc moviesBloc;
  setUpAll(() {
    nock.init();
    // registerFallbackValue(<Car>)
  });

  setUp(() {
    moviesBloc = MockMoviesBloc();

    nock.cleanAll();
  });

  group('MovieScreen', () {
    testWidgets('renders SliverAppBar', (WidgetTester tester) async {
      when(() => moviesBloc.state).thenReturn(MoviesFetchInProgress());

      await tester.pumpApp(child: MovieScreen());

      expect(find.byType(SliverAppBar), findsOneWidget);
    });

    testWidgets(
        'renders CircularProgressIndicator while app is fetching moives',
        (tester) async {
      when(() => moviesBloc.state).thenReturn(MoviesFetchInProgress());

      await tester.pumpApp(child: const MovieScreen());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'renders error message after fetching movieswith HTTP'
        'status code 400', (WidgetTester tester) async {
      final Interceptor intercepor = nock('https://api.themoviedb.org/3/movie/')
          .get('/now_playing')
        ..reply(400, '{}');
      // when(() => moviesBloc.state).thenReturn(MoviesFetchFailure('error'));

      await tester.pumpApp(child: const MovieScreen());

      expect(find.text('Something went wrong.'), findsOneWidget);
    });
  });
}
