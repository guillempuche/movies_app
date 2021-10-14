import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../entity/movie_entity.dart';
import '../api/i_movies_api.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({required this.moviesApi}) : super(MoviesFetchInProgress()) {
    on<MoviesFetchingStarted>(_onStarted);
    // on<MoviesFetched>(_onMoviesFetched);
    on<MoviesOneSelected>(_onMoviesOneSelected);
  }

  final IMoviesApi moviesApi;

  void _onStarted(_, Emitter<MoviesState> emit) async {
    emit(MoviesFetchInProgress());

    try {
      final List<MovieEntity> movies = await moviesApi.getMovies();
      emit(MoviesFetchSuccess(movies));
    } catch (err) {
      emit(MoviesFetchFailure(err.toString()));
    }
  }

  void _onMoviesOneSelected(
      MoviesOneSelected event, Emitter<MoviesState> emit) {
    emit(MoviesSelectMovie(event.movie));
  }
}
