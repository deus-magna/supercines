import 'package:supercines/models/actores_model.dart';
import 'package:supercines/models/calendar_data_model.dart';
import 'package:supercines/models/genre_model.dart';
import 'package:supercines/models/seats_row_model.dart';
import 'package:supercines/models/time_data_model.dart';

String getActors(List<Actor> actors) {
  var actorsString = '';
  for (var i = 0; i < 3; i++) {
    actorsString = '$actorsString ${actors[i].name!.toUpperCase()},';
  }
  return actorsString.substring(0, actorsString.length - 1);
}

String getGenresFromId(List<int>? genreIds, List<Genre>? genres) {
  var genresString = '';
  for (final id in genreIds!) {
    for (final genre in genres!) {
      if (id == genre.id) {
        genresString = '$genresString ${genre.name},';
      }
    }
  }
  return genresString.substring(0, genresString.length - 1);
}

List<Calendar> getMockCalendar() {
  return [
    Calendar(11, 'SA'),
    Calendar(12, 'SU'),
    Calendar(13, 'MO'),
    Calendar(14, 'TU'),
    Calendar(15, 'WE'),
    Calendar(16, 'TH'),
    Calendar(17, 'FR'),
  ];
}

List<TimeData> getMockTimeAndPrice() {
  return [
    TimeData('17:25', r'FROM $3,75'),
    TimeData('19:55', r'FROM $3,75'),
    TimeData('20:25', r'FROM $3,75'),
    TimeData('21:05', r'FROM $3,75')
  ];
}

List<SeatsRow> getMockSeatsList() {
  return [
    SeatsRow(numberOfSeats: 8, reservedSeats: [1], selectedSeats: []),
    SeatsRow(numberOfSeats: 8, reservedSeats: [], selectedSeats: []),
    SeatsRow(numberOfSeats: 8, reservedSeats: [2], selectedSeats: []),
    SeatsRow(numberOfSeats: 8, reservedSeats: [1, 2], selectedSeats: []),
    SeatsRow(numberOfSeats: 8, reservedSeats: [3, 4], selectedSeats: []),
  ];
}
