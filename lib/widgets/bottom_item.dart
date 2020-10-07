import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  final IconData icon;
  final double size;
  final MainAxisAlignment alignment;

  const BottomItem({
    Key key,
    @required this.icon,
    @required this.size,
    @required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      width: screenSize.width,
      bottom: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: alignment,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: size,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
