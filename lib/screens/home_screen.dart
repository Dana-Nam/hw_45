import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';
import 'movie_create_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie(
      title: 'Сумерки',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/ru/6/63/%D0%A1%D1%83%D0%BC%D0%B5%D1%80%D0%BA%D0%B8_%28%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%2C_2008%29.jpg',
      year: '2008',
      description: 'История любви между вампиром и девушкой в старшей школе.',
      rating: '4',
      isWatched: true,
    ),
    Movie(
      title: 'Сумерки. Сага. Новолуние',
      posterUrl:
          'https://thumbs.dfs.ivi.ru/storage6/contents/7/6/18dfae2fa6c37c88aed9ad03a3ba30.jpg',
      year: '2009',
      description: 'История любви между вампиром и девушкой в старшей школе.',
      rating: '3',
      isWatched: false,
    ),
    Movie(
      title: 'Сумерки. Сага. Затмение',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/ru/b/bd/Eclipse_2010_film.jpg',
      year: '2010',
      description: 'История любви между вампиром и девушкой в старшей школе.',
      rating: '5',
      isWatched: false,
    ),
    Movie(
      title: 'Сумерки. Сага. Рассвет: Часть 1',
      posterUrl:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/b78baee7-51cb-43c9-bb2b-457b859e4187/220x330',
      year: '2011',
      description: 'История любви между вампиром и девушкой в старшей школе.',
      rating: '3',
      isWatched: true,
    ),
    Movie(
      title: 'Сумерки. Сага. Рассвет: Часть 2',
      posterUrl:
          'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/f01e3eaf-ac14-4a43-972f-e4750883ffd1/220x330',
      year: '2012',
      description: 'История любви между вампиром и девушкой в старшей школе.',
      rating: '3',
      isWatched: true,
    ),
    Movie(
      title: 'Аватар',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/ru/thumb/4/4b/Avatar-2009.jpg/640px-Avatar-2009.jpg',
      year: '2009',
      description: 'Приключения в удивительном мире другой планеты.',
      rating: '5',
      isWatched: true,
    ),
    Movie(
      title: 'Аватар 2',
      posterUrl:
          'https://upload.wikimedia.org/wikipedia/ru/b/b3/%D0%90%D0%B2%D0%B0%D1%82%D0%B0%D1%80_%D0%9F%D1%83%D1%82%D1%8C_%D0%B2%D0%BE%D0%B4%D1%8B_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpg',
      year: '2023',
      description: 'Приключения в удивительном мире другой планеты 2.',
      rating: '5',
      isWatched: false,
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Movie> filtered = currentIndex == 0
        ? movies.where((m) => !m.isWatched).toList()
        : movies.where((m) => m.isWatched).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Movie Tracker')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: filtered.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final movie = filtered[index];
              return Column(
                children: [
                  MovieCard(
                    movie: movie,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => MovieDetailScreen(
                            movie: movie,
                            onUpdate: () => setState(() {}),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              );
            }),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Movie? newMovie = await Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => MovieCreateScreen()),
          );

          if (newMovie != null) {
            setState(() {
              movies.add(newMovie);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
