class SeatsRow {
  final int numberOfSeats;
  final List<int> reservedSeats;
  final List<int> selectedSeats;

  SeatsRow({
    required this.selectedSeats,
    required this.numberOfSeats,
    required this.reservedSeats,
  });
}
