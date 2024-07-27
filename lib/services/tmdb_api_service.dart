import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter3/models/movie.dart';

class TMDBApiService {
  static const String _apiKey = 'YOUR_TMDB_API_KEY';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchMovies(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/$category?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Movie> fetchMovieDetail(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/$id?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query'));

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
