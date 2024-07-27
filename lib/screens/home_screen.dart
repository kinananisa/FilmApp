import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter3/providers/movie_provider.dart';
import 'package:flutter3/widgets/movie_list.dart';
import 'package:flutter3/screens/search_screen.dart';
import 'package:flutter3/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
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
        title: Text('Film App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.movies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return MovieList(movies: movieProvider.movies);
          }
        },
      ),
    );
  }
}
