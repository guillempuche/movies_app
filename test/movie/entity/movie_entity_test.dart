import 'package:movies_app/movie/entity/movie_entity.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group('MovieEntity', () {
    final MovieEntity mockItem = mockItems[0];

    final MovieEntity movie = MovieEntity(
      id: mockItem.id,
      title: mockItem.title,
      image: mockItem.image,
      overview: mockItem.overview,
      externalLink: mockItem.externalLink,
    );

    test('Create a MovieEntity', () {
      expect(
          MovieEntity(
              id: mockItem.id,
              title: mockItem.title,
              image: mockItem.image,
              overview: mockItem.overview,
              externalLink: mockItem.externalLink),
          mockItem);
    });

    test('id is type String', () {
      expect(movie.id.runtimeType, String);
    });
    test('title is type String', () {
      expect(movie.title.runtimeType, String);
    });
    test('image is type String', () {
      expect(movie.image.runtimeType, String);
    });
    test('overview is type String', () {
      expect(movie.overview.runtimeType, String);
    });
    test('externalLink is type String', () {
      expect(movie.externalLink.runtimeType, String);
    });
  });
}
