import 'package:flutter/material.dart';

import 'movie/presentation/movie_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieScreen(),
    );
  }
}
