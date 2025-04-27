import 'package:flutter/material.dart';
import 'package:hw_45/providers/movie_provider.dart';
import 'package:hw_45/app_routes.dart';
import 'package:hw_45/screens/home_screen.dart';
import 'package:hw_45/screens/movie_create_screen.dart';
import 'package:hw_45/screens/movie_detail_screen.dart';
import 'package:hw_45/models/movie.dart';

void main() {
  runApp(
    MovieProvider(
      movies: [
        Movie(
          title: 'Сумерки',
          posterUrl:
              'https://upload.wikimedia.org/wikipedia/ru/6/63/%D0%A1%D1%83%D0%BC%D0%B5%D1%80%D0%BA%D0%B8_%28%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%2C_2008%29.jpg',
          year: '2008',
          description:
              'История любви между вампиром и девушкой в старшей школе.',
          rating: '4',
          isWatched: true,
        ),
        Movie(
          title: 'Сумерки. Сага. Новолуние',
          posterUrl:
              'https://thumbs.dfs.ivi.ru/storage6/contents/7/6/18dfae2fa6c37c88aed9ad03a3ba30.jpg',
          year: '2009',
          description:
              'История любви между вампиром и девушкой в старшей школе.',
          rating: '3',
          isWatched: false,
        ),
        Movie(
          title: 'Сумерки. Сага. Затмение',
          posterUrl:
              'https://upload.wikimedia.org/wikipedia/ru/b/bd/Eclipse_2010_film.jpg',
          year: '2010',
          description:
              'История любви между вампиром и девушкой в старшей школе.',
          rating: '5',
          isWatched: false,
        ),
        Movie(
          title: 'Сумерки. Сага. Рассвет: Часть 1',
          posterUrl:
              'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/b78baee7-51cb-43c9-bb2b-457b859e4187/220x330',
          year: '2011',
          description:
              'История любви между вампиром и девушкой в старшей школе.',
          rating: '3',
          isWatched: true,
        ),
        Movie(
          title: 'Сумерки. Сага. Рассвет: Часть 2',
          posterUrl:
              'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/f01e3eaf-ac14-4a43-972f-e4750883ffd1/220x330',
          year: '2012',
          description:
              'История любви между вампиром и девушкой в старшей школе.',
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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.detail: (context) {
          final movie = ModalRoute.of(context)!.settings.arguments as Movie;
          return MovieDetailScreen(movie: movie);
        },
        AppRoutes.create: (context) => MovieCreateScreen(),
      },
    );
  }
}
