part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesFetchInProgress extends MoviesState {}

class MoviesFetchSuccess extends MoviesState {
  const MoviesFetchSuccess(this.movies);

  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}

class MoviesFetchFailure extends MoviesState {
  const MoviesFetchFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class MoviesSelectMovie extends MoviesState {
  const MoviesSelectMovie(this.movie);

  final MovieEntity movie;

  @override
  List<Object> get props => [movie];
}
