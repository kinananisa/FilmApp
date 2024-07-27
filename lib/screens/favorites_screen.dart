import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter3/providers/movie_provider.dart';
import 'package:flutter3/widgets/movie_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final favoriteMovies = movieProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: MovieList(movies: favoriteMovies),
    );
  }
}
