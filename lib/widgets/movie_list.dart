import 'package:flutter/material.dart';
import 'package:flutter3/models/movie.dart';
import 'package:flutter3/screens/movie_detail_screen.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          leading: Image.network('https://image.tmdb.org/t/p/w92${movie.posterPath}'),
          title: Text(movie.title),
          subtitle: Text(movie.releaseDate),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movieId: movie.id),
              ),
            );
          },
        );
      },
    );
  }
}
