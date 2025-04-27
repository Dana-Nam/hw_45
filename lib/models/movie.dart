class Movie {
  final String title;
  final String posterUrl;
  final String year;
  final String description;
  final String? rating;
  final bool isWatched;

  Movie({
    required this.title,
    required this.posterUrl,
    required this.year,
    required this.description,
    this.rating,
    this.isWatched = false,
  });

  Movie copyWith({
    String? title,
    String? posterUrl,
    String? year,
    String? description,
    String? rating,
    bool? isWatched,
  }) {
    return Movie(
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      year: year ?? this.year,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      isWatched: isWatched ?? this.isWatched,
    );
  }
}
