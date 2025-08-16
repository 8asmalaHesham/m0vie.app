class MovieModel {
  final bool? adult;
  final int? id;
  final String? title;
  final String? backdropPath;
  final String? overview;
  final String? originalLanguage;
  final String? releaseDate;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;
  final String? originalTitle;

  MovieModel(
    this.adult,
    this.id,
    this.title,
    this.backdropPath,
    this.overview,
    this.originalLanguage,
    this.releaseDate,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.originalTitle,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      json['adult'],
      json['id'],
      json['title'],
      json['backdrop_path'],
      json['overview'],
      json['original_language'],
      json['release_date'],
      (json['popularity'] as num?)?.toDouble(),
      json['poster_path'],
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'],
      json['original_title'],
    );
  }

}