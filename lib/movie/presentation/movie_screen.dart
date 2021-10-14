import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/bloc/movies_bloc.dart';
import '../services/api/tmdb_movies_api.dart';
import 'movies_list.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MoviesBloc(moviesApi: TmdbMoviesApi())
            ..add(MoviesFetchingStarted()),
        ),
      ],
      child: Theme(
        data: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
        ),
        child: SafeArea(
          child: Scaffold(
            body: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text('Movies at Cinemas'),
                      floating: true,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () => context
                              .read<MoviesBloc>()
                              .add(MoviesFetchingStarted()),
                        ),
                      ],
                    ),
                    state is MoviesFetchInProgress
                        ? const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : state is MoviesFetchSuccess
                            ? const MoviesList()
                            : const SliverToBoxAdapter(
                                child: Center(
                                    child: Text('Something went wrong.')),
                              ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
