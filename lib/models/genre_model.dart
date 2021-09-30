import 'dart:convert';

GenreModel genreModelFromJson(String str) =>
    GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
  GenreModel({
    required this.genres,
  });

  final List<Genre> genres;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
