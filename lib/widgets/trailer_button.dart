import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';

class TrailerButton extends StatelessWidget {
  const TrailerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 27,
          width: 27,
          decoration: BoxDecoration(
              color: yellow, borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          'VIEW TRAILER',
          style: TextStyle(color: yellow, fontSize: 12),
        ),
      ],
    );
  }
}
