import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/bloc/movies_bloc.dart';
import 'movie_item.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({
    Key? key,
  }) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  int numOfMovies = 0;
  late int total;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, int index) {
        return BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesFetchSuccess) {
              return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: MovieItem(movie: state.movies[index]));
            }
            return Center(child: Text('Error'));
          },
        );
      }),
    );
  }
}
