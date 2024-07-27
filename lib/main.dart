import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter3/providers/movie_provider.dart';
import 'package:flutter3/services/tmdb_api_service.dart';
import 'package:flutter3/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(TMDBApiService()),
      child: MaterialApp(
        title: 'Film App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
