class Media {
  int movieId;
  String title;
  String backdropPath;
  String posterPath;
  String overview;
  double popularity;
  double voteAverage;
  DateTime releaseDate;

  Media(
      {this.movieId = 0,
      this.title = "",
      this.backdropPath = "",
      this.posterPath = "",
      this.overview = "",
      this.popularity = 0,
      this.voteAverage = 0,
      required this.releaseDate});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      movieId: json['id'],
      title: json['title'] ?? json['name'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      voteAverage: json['vote_average'].toDouble(),
      releaseDate:
          DateTime.parse(json['release_date'] ?? json['first_air_date']),
    );
  }

  @override
  String toString() {
    return 'Movie{movieId: $movieId, title: $title, backdropPath: $backdropPath, posterPath: $posterPath, overview: $overview, popularity: $popularity, voteAverage: $voteAverage, releaseDate: $releaseDate}';
  }
}
