import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieProvider extends InheritedNotifier<ValueNotifier<List<Movie>>> {
  MovieProvider({
    super.key,
    required super.child,
    required List<Movie> movies,
  }) : super(notifier: ValueNotifier<List<Movie>>(movies));

  static ValueNotifier<List<Movie>> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MovieProvider>()!
        .notifier!;
  }

  @override
  bool updateShouldNotify(covariant MovieProvider oldWidget) {
    return notifier != oldWidget.notifier;
  }
}
