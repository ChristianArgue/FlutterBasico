import 'dart:convert';

class Serie {
    Serie({
       required this.backdropPath,
       required this.firstAirDate,
       required this.genreIds,
       required this.id,
       required this.name,
       required this.originCountry,
       required this.originalLanguage,
       required this.originalName,
       required this.overview,
       required this.popularity,
       required this.posterPath,
       required this.voteAverage,
       required this.voteCount,
    });

    String backdropPath;
    DateTime firstAirDate;
    List<int> genreIds;
    int id;
    String name;
    List<String> originCountry;
    String originalLanguage;
    String originalName;
    String overview;
    double popularity;
    String posterPath;
    double voteAverage;
    int voteCount;

    factory Serie.fromJson(String str) => Serie.fromMap(json.decode(str));

    factory Serie.fromMap(Map<String, dynamic> json) => Serie(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );
}
