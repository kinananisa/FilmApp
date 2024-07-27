import 'package:flutter/material.dart';
import 'package:flutter3/models/movie.dart';
import 'package:flutter3/services/tmdb_api_service.dart';

class MovieProvider with ChangeNotifier {
  final TMDBApiService apiService;
  List<Movie> _movies = [];
  final List<Movie> _favorites = [];
  Movie? _selectedMovie;

  MovieProvider(this.apiService);

  List<Movie> get movies => _movies;
  List<Movie> get favorites => _favorites;
  Movie? get selectedMovie => _selectedMovie;

  Future<void> fetchMovies(String category) async {
    _movies = await apiService.fetchMovies(category);
    notifyListeners();
  }

  Future<void> fetchMovieDetail(int id) async {
    _selectedMovie = await apiService.fetchMovieDetail(id);
    notifyListeners();
  }

  Future<void> searchMovies(String query) async {
    _movies = await apiService.searchMovies(query);
    notifyListeners();
  }

  void addFavorite(Movie movie) {
    _favorites.add(movie);
    notifyListeners();
  }

  void removeFavorite(Movie movie) {
    _favorites.remove(movie);
    notifyListeners();
  }

  bool isFavorite(Movie movie) {
    return _favorites.contains(movie);
  }
}
