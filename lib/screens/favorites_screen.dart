import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter3/providers/movie_provider.dart';
import 'package:flutter3/widgets/movie_list.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Film'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Provider.of<MovieProvider>(context, listen: false).searchMovies(_controller.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<MovieProvider>(
              builder: (context, movieProvider, child) {
                if (movieProvider.movies.isEmpty) {
                  return Center(child: Text('No results found'));
                } else {
                  return MovieList(movies: movieProvider.movies);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
