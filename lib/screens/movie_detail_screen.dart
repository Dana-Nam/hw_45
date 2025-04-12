import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  final VoidCallback onUpdate;

  MovieDetailScreen({required this.movie, required this.onUpdate});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  int rating = 3;

  @override
  void initState() {
    super.initState();
    rating = int.tryParse(widget.movie.rating ?? '3') ?? 3;
  }

  @override
  Widget build(BuildContext context) {
    bool canRate = widget.movie.isWatched;

    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          children: [
            Image.network(widget.movie.posterUrl),
            SizedBox(height: 16),
            Text(widget.movie.title,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 8),
            Text(widget.movie.year),
            SizedBox(height: 16),
            Text(widget.movie.description),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (widget.movie.isWatched) {
                    widget.movie.isWatched = false;
                    widget.movie.rating = null;
                  } else {
                    widget.movie.isWatched = true;
                    widget.movie.rating = rating.toString();
                  }
                });
                widget.onUpdate();
              },
              child: Text(widget.movie.isWatched
                  ? 'Вернуть в непросмотренные'
                  : 'Посмотрено'),
            ),
            if (canRate)
              Column(
                children: [
                  SizedBox(height: 16),
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
                                  widget.movie.rating = rating.toString();
                                });
                                widget.onUpdate();
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
                                  widget.movie.rating = rating.toString();
                                });
                                widget.onUpdate();
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
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Готово'),
            ),
          ],
        ),
      ),
    );
  }
}
