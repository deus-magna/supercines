import 'package:flutter/material.dart';
import 'package:supercines/models/seats_row_model.dart';
import 'package:supercines/widgets/movie_seats/row_of_seats_widget.dart';

class MovieSeats extends StatelessWidget {
  final List<SeatsRow> seats;
  final Function(int row, int index) onItemSelected;

  const MovieSeats({
    Key key,
    this.seats,
    @required this.onItemSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: seats.length,
        itemBuilder: (BuildContext context, int index) {
          return RowOfSeats(
            seats: seats[index],
            onItemSelected: (value) => onItemSelected(index, value),
          );
        },
      ),
    );
  }
}
