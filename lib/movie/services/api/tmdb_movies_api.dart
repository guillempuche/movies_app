import 'package:http/http.dart' as http;
import 'package:g_json/g_json.dart';

import 'i_movies_api.dart';
import '/movie/entity/movie_entity.dart';
import '/shared/api_keys.env.dart';

class TmdbMoviesApiException extends IMoviesApiException {
  const TmdbMoviesApiException([String? message]) : super(message);
}

class TmdbMoviesApi extends IMoviesApi {
  @override
  Future<List<MovieEntity>> getMovies() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?api_key=$tmdbApiKey&language=en-US&page=1'),
      );

      if (response.statusCode == 200) {
        final JSON body = JSON.parse(response.body);
        final List<dynamic> listJsonMovies = body['results'].value;
        List<MovieEntity> listMovies = [];

        for (dynamic jsonMovie in listJsonMovies) {
          listMovies.add(MovieEntity(
            id: jsonMovie['id'].toString(),
            title: jsonMovie['title'] as String,
            image:
                'https://image.tmdb.org/t/p/w500/${jsonMovie['poster_path']}',
            overview: jsonMovie['overview'] as String,
            externalLink: 'https://www.themoviedb.org/movie/${jsonMovie['id']}',
          ));
        }
        return listMovies;
      } else {
        throw TmdbMoviesApiException(
            'HTTP GET ${response.statusCode} : $response');
      }
    } catch (err) {
      throw TmdbMoviesApiException(err.toString());
    }
  }
}
