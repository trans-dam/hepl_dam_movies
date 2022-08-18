class Actor {
  final String name;
  final double popularity;
  final String profilePath;
  final String character;

  Actor(
      {this.name = "",
      this.popularity = 0,
      this.profilePath = "",
      this.character = ""});

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      name: json['name'],
      popularity: json['popularity'].toDouble(),
      profilePath: json['profile_path'],
      character: json['character'],
    );
  }
}
