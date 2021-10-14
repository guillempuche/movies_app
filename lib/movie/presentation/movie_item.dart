import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/bloc/movies_bloc.dart';
import '../entity/movie_entity.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      return Container(
        child: ListTile(
          title: Text(movie.title),
          leading: Image.network(movie.image),
          subtitle: Text('${movie.overview.substring(0, 70)}...'),
          onTap: () => context.read<MoviesBloc>().add(MoviesOneSelected(movie)),
        ),
      );
    });
  }
}
