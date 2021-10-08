import 'package:flutter/material.dart';

typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);

class HorizontalScrollList extends StatelessWidget {
  const HorizontalScrollList({
    Key? key,
    this.height = 90.0,
    this.backgroundColor = Colors.transparent,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  final double height;
  final Color backgroundColor;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: backgroundColor,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
