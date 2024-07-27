import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter3/providers/movie_provider.dart';
import 'package:flutter3/screens/favorites_screen.dart';
import 'package:flutter3/screens/search_screen.dart'; // Pastikan path ini benar
import '../widgets/movie_list.dart'; // Impor MovieList dari lokasi yang benar

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).fetchMovies('now_playing');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()), // Perbaiki instansiasi SearchScreen
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()), // Perbaiki instansiasi FavoritesScreen
              );
            },
          ),
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return MovieList(movies: movieProvider.movies);
          }
        },
      ),
    );
  }
}
