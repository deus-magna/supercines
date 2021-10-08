class SeatsRow {
  SeatsRow({
    required this.selectedSeats,
    required this.numberOfSeats,
    required this.reservedSeats,
  });

  final int numberOfSeats;
  final List<int> reservedSeats;
  final List<int> selectedSeats;
}
