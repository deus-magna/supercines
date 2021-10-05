import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:supercines/models/actores_model.dart';
import 'package:supercines/models/genre_model.dart';
import 'package:supercines/models/movie_model.dart';

class MoviesService {
  final _apiKey = '305aa7a9d3a51627ba9a672d87167914';
  final _url = 'api.themoviedb.org';
  final _language = 'en-US'; //'es-ES';

  Future<List<Movie>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = Movies.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  // API para obtener los actores de la pelicula.
  Future<List<Actor>> getCast(String movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = Cast.fromJsonList(decodedData['cast']);
    return cast.actors;
  }

  Future<List<Genre>> getGenreList() async {
    final url = Uri.https(_url, '3/genre/movie/list',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);

    final genreList = genreModelFromJson(resp.body);

    return genreList.genres;
  }
}
