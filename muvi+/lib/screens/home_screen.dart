import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context,);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Peliculas en Cine')
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context, delegate: MovieSearchDelegate()), 
            icon: Icon(Icons.search_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas Principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // Slider de Peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies()
            ),
          ],
        ),
      )
    );
  }
}