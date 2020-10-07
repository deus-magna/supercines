import 'package:supercines/models/actores_model.dart';
import 'package:supercines/models/genre_model.dart';

String getActors(List<Actor> actors) {
  String actorsString = '';
  for (var i = 0; i < 3; i++) {
    actorsString = '$actorsString ${actors[i].name.toUpperCase()},';
  }
  return actorsString.substring(0, actorsString.length - 1);
}

String getGenresFromId(List<int> genreIds, List<Genre> genres) {
  String genresString = '';
  for (int id in genreIds) {
    for (Genre genre in genres) {
      if (id == genre.id) {
        genresString = '$genresString ${genre.name},';
      }
    }
  }
  return genresString.substring(0, genresString.length - 1);
}
