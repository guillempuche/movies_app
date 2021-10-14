part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MoviesFetchingStarted extends MoviesEvent {}

class MoviesFetched extends MoviesEvent {
  const MoviesFetched(this.moviesFetched);

  final List<MovieEntity> moviesFetched;

  @override
  List<Object> get props => [moviesFetched];
}

class MoviesOneSelected extends MoviesEvent {
  const MoviesOneSelected(this.movie);

  final MovieEntity movie;

  @override
  List<Object> get props => [movie];
}
