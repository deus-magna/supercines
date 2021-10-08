// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

GenreModel genreModelFromJson(String str) =>
    GenreModel.fromJson(json.decode(str) as Map<String, dynamic>);

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
  GenreModel({required this.genres});

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
      );

  final List<Genre> genres;

  Map<String, dynamic> toJson() => {
        'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  final int id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
