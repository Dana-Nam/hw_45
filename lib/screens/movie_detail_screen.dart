import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../providers/movie_provider.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late int rating;
  late ValueNotifier<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    rating = int.tryParse(widget.movie.rating ?? '3') ?? 3;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movies = MovieProvider.of(context);
  }

  void updateMovie(Movie updatedMovie) {
    final updatedMovies = movies.value.map((m) {
      if (m == widget.movie) return updatedMovie;
      return m;
    }).toList();
    movies.value = updatedMovies;
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    final canRate = movie.isWatched;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              movie.posterUrl,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Text(movie.year),
            SizedBox(height: 16),
            Text(movie.description),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final updated = movie.copyWith(
                  isWatched: !movie.isWatched,
                  rating: !movie.isWatched ? rating.toString() : null,
                );
                updateMovie(updated);
              },
              child: Text(
                  movie.isWatched ? 'Вернуть в непросмотренные' : 'Посмотрено'),
            ),
            if (canRate)
              Column(
                children: [
                  SizedBox(height: 24),
                  Text('Оцените фильм'),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('1'),
                      SizedBox(width: 12),
                      IconButton(
                        onPressed: rating > 1
                            ? () {
                                setState(() {
                                  rating--;
                                  final updated =
                                      movie.copyWith(rating: rating.toString());
                                  updateMovie(updated);
                                });
                              }
                            : null,
                        icon: Icon(Icons.remove),
                      ),
                      Text('$rating'),
                      IconButton(
                        onPressed: rating < 5
                            ? () {
                                setState(() {
                                  rating++;
                                  final updated =
                                      movie.copyWith(rating: rating.toString());
                                  updateMovie(updated);
                                });
                              }
                            : null,
                        icon: Icon(Icons.add),
                      ),
                      SizedBox(width: 12),
                      Text('5'),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
