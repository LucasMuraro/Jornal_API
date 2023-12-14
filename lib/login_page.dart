/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Movie {
  final String title;
  final String overview;
  final String posterPath;

  Movie({required this.title, required this.overview, required this.posterPath});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Filmes Populares'),
        ),
        body: MovieListScreen(),
      ),
    );
  }
}

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final String apiKey = '6d9632884fd6781292292fb6188c930f';
  final String apiUrl = 'https://api.themoviedb.org/3/movie/popular';

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('$apiUrl?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((item) {
        return Movie(
          title: item['title'],
          overview: item['overview'],
          posterPath: item['poster_path'],
        );
      }).toList();

      return movies;
    } else {
      throw Exception('Falha ao carregar filmes populares: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: fetchPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else {
          return MovieListView(movies: snapshot.data!);
        }
      },
    );
  }
}

class MovieListView extends StatelessWidget {
  final List<Movie> movies;

  MovieListView({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(movies[index].title),
          subtitle: Text(movies[index].overview),
          leading: movies[index].posterPath != null
              ? Image.network('https://image.tmdb.org/t/p/w200${movies[index].posterPath}')
              : Icon(Icons.movie),
        );
      },
    );
  }
}
*/