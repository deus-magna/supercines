import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';
import 'package:supercines/models/calendar_data_model.dart';

class CalendarButton extends StatelessWidget {
  final Calendar calendar;
  final Function()? onPressed;
  final bool selected;

  const CalendarButton({
    required this.calendar,
    this.onPressed,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      width: 52,
      decoration: roundedDecoration(selected),
      child: _buildCalendarColumn(),
    );
  }

  Widget _buildCalendarColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${calendar.number}',
          textAlign: TextAlign.center,
          style: selected
              ? TextStyle(fontSize: 25, color: Colors.black)
              : TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(height: 3),
        Text(
          '${calendar.title}',
          textAlign: TextAlign.center,
          style: selected
              ? TextStyle(
                  fontSize: 15, color: Color(0xFF021333).withOpacity(0.45))
              : TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.45)),
        ),
      ],
    );
  }
}
