import 'package:flutter/material.dart';
import 'package:supercines/models/seats_row_model.dart';
import 'package:supercines/widgets/movie_seats/movie_seat_widget.dart';

class RowOfSeats extends StatelessWidget {
  const RowOfSeats({
    Key? key,
    required this.seats,
    required this.onItemSelected,
  }) : super(key: key);

  final SeatsRow seats;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        seats.numberOfSeats,
        (index) => (index == 4)
            ? MovieSeat(
                size: MediaQuery.of(context).size.width * 0.072,
                margin: EdgeInsets.only(left: 8, right: 25),
                reserved: seats.reservedSeats.contains(index + 1),
                selected: seats.selectedSeats.contains(index + 1),
                onSelected: () {
                  onItemSelected(index);
                },
              )
            : MovieSeat(
                size: MediaQuery.of(context).size.width * 0.072,
                reserved: seats.reservedSeats.contains(index + 1),
                selected: seats.selectedSeats.contains(index + 1),
                onSelected: () {
                  onItemSelected(index);
                },
              ),
      ),
    );
  }
}
