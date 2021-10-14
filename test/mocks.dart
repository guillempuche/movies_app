import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app/movie/entity/movie_entity.dart';
import 'package:movies_app/movie/services/bloc/movies_bloc.dart';

const List<MovieEntity> mockItems = [
  MovieEntity(
      id: '580489',
      title: 'Venom: Let There Be Carnage',
      image: 'https://image.tmdb.org/t/p/w500/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg',
      overview:
          'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.',
      externalLink: 'https://www.themoviedb.org/movie/580489'),
  MovieEntity(
      id: '550988',
      title: '"Free Guy',
      image: 'https://image.tmdb.org/t/p/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg',
      overview:
          'A bank teller called Guy realizes he is a background character in an open world video game called Free City that will soon go offline.',
      externalLink: 'https://www.themoviedb.org/movie/550988'),
];

class MockMoviesBloc extends Mock implements MoviesBloc {}

class MockMoviesEvent extends Mock implements MoviesEvent {}

class MockMoviesState extends Mock implements MoviesState {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp({
    MoviesBloc? moviesBloc,
    required Widget child,
  }) {
    registerFallbackValue<MoviesEvent>(MockMoviesEvent());
    registerFallbackValue<MoviesState>(MockMoviesState());

    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            moviesBloc != null
                ? BlocProvider.value(value: moviesBloc)
                : BlocProvider(create: (_) => MockMoviesBloc()),
          ],
          child: child,
        ),
      ),
    );
  }
}

String jsonTmdbBody = jsonEncode({
  "dates": {"maximum": "2021-10-10", "minimum": "2021-08-23"},
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/t9nyF3r0WAlJ7Kr6xcRYI4jr9jm.jpg",
      "genre_ids": [878, 28],
      "id": 580489,
      "original_language": "en",
      "original_title": "Venom: Let There Be Carnage",
      "overview":
          "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.",
      "popularity": 11957.463,
      "poster_path": "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg",
      "release_date": "2021-09-30",
      "title": "Venom: Let There Be Carnage",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 429
    },
    {
      "adult": false,
      "backdrop_path": "/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg",
      "genre_ids": [35, 28, 12, 878],
      "id": 550988,
      "original_language": "en",
      "original_title": "Free Guy",
      "overview":
          "A bank teller called Guy realizes he is a background character in an open world video game called Free City that will soon go offline.",
      "popularity": 7283.521,
      "poster_path": "/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg",
      "release_date": "2021-08-11",
      "title": "Free Guy",
      "video": false,
      "vote_average": 7.9,
      "vote_count": 2512
    },
    {
      "adult": false,
      "backdrop_path": "/aO9Nnv9GdwiPdkNO79TISlQ5bbG.jpg",
      "genre_ids": [28, 12],
      "id": 568620,
      "original_language": "en",
      "original_title": "Snake Eyes: G.I. Joe Origins",
      "overview":
          "After saving the life of their heir apparent, tenacious loner Snake Eyes is welcomed into an ancient Japanese clan called the Arashikage where he is taught the ways of the ninja warrior. But, when secrets from his past are revealed, Snake Eyes' honor and allegiance will be tested – even if that means losing the trust of those closest to him.",
      "popularity": 3740.301,
      "poster_path": "/uIXF0sQGXOxQhbaEaKOi2VYlIL0.jpg",
      "release_date": "2021-07-22",
      "title": "Snake Eyes: G.I. Joe Origins",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 616
    },
  ]
});
