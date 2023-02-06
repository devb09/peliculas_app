import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/providers/popular_movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    final popularMoviesProvider =
        Provider.of<PopularMoviesProvider>(context, listen: true);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cine'),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //slider pelis
            MovieSlider(movies: popularMoviesProvider.onDisplayMovies),
          ],
        ),
      ),
    );
  }
}
