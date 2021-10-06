import 'package:flutter/material.dart';
import 'package:supercines/models/seats_row_model.dart';
import 'package:supercines/widgets/movie_seats/row_of_seats_widget.dart';

class MovieSeats extends StatelessWidget {
  const MovieSeats({
    Key? key,
    required this.seats,
    required this.onItemSelected,
  }) : super(key: key);

  final List<SeatsRow> seats;
  final Function(int row, int index) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: seats.length,
      itemBuilder: (BuildContext context, int index) {
        return RowOfSeats(
          seats: seats[index],
          onItemSelected: (value) => onItemSelected(index, value),
        );
      },
    );
  }
}
