import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import '../app_routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final movies = MovieProvider.of(context).value;
    final filteredMovies = currentIndex == 0
        ? movies.where((m) => !m.isWatched).toList()
        : movies.where((m) => m.isWatched).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Movie Tracker')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: filteredMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final movie = filteredMovies[index];
            return Column(
              children: [
                Expanded(
                  child: MovieCard(
                    movie: movie,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.detail,
                        arguments: movie,
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newMovie = await Navigator.pushNamed(context, AppRoutes.create);
          if (newMovie is Movie) {
            final movies = MovieProvider.of(context);
            movies.value = List.from(movies.value)..add(newMovie);
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Собираюсь посмотреть',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Посмотрено',
          ),
        ],
      ),
    );
  }
}
