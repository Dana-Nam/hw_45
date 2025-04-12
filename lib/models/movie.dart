class Movie {
  final String title;
  final String posterUrl;
  final String year;
  final String description;
  String? rating;
  bool isWatched;

  Movie({
    required this.title,
    required this.posterUrl,
    required this.year,
    required this.description,
    this.rating,
    this.isWatched = false,
  });
}
