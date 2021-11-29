class NewMovies {
  final String? title;
  final String? year;
  final String? imdbID;
  final String? type;
  final String? poster;

  NewMovies({this.title, this.year, this.imdbID, this.type, this.poster});

  factory NewMovies.fromJson(Map<String, dynamic> json) => NewMovies(
    title: json['Title'] as String,
    year: json['Year'] as String,
    imdbID: json['imdbID'] as String,
    type: json['Type'] as String,
    poster: json['Poster'] as String,
  );
}
