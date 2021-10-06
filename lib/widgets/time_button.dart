import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';
import 'package:supercines/models/time_data_model.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    Key? key,
    required this.timeData,
    this.onPressed,
    this.selected = false,
  }) : super(key: key);

  final TimeData timeData;
  final Function()? onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      width: 120,
      decoration: outlineDecoration(selected),
      child: _buildPriceAndTimeColumn(),
    );
  }

  Column _buildPriceAndTimeColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          timeData.date,
          textAlign: TextAlign.center,
          style: selected
              ? const TextStyle(fontSize: 25, color: yellow)
              : TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.50)),
        ),
        const SizedBox(height: 3),
        Text(
          timeData.price,
          textAlign: TextAlign.center,
          style: selected
              ? TextStyle(fontSize: 15, color: yellow.withOpacity(0.45))
              : TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.45)),
        ),
      ],
    );
  }
}
