import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';

class MovieSeat extends StatelessWidget {
  final double size;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final Color borderColor;
  final Color reservedColor;
  final Color selectedColor;
  final double borderWidth;
  final bool reserved;
  final bool selected;
  final Function onSelected;

  const MovieSeat({
    Key key,
    this.size = 27,
    this.margin = const EdgeInsets.all(8),
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.borderWidth = 1.0,
    this.reserved = false,
    this.selected = false,
    this.reservedColor = blue,
    this.selectedColor = yellow,
    @required this.onSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        height: size,
        width: size,
        margin: margin,
        decoration: BoxDecoration(
            color: selected
                ? selectedColor
                : reserved ? reservedColor : backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            )),
      ),
    );
  }
}
