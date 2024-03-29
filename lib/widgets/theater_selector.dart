import 'package:flutter/material.dart';
import 'package:supercines/framework/custom_icons.dart';
import 'package:supercines/framework/framework.dart';

class TheaterSelector extends StatelessWidget {
  const TheaterSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: const [
          Icon(
            CustomIcons.location,
            color: blue,
            size: 18,
          ),
          SizedBox(width: 5),
          Text(
            'CC. El Dorado',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
