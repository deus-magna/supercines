import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  final double size;
  final MainAxisAlignment alignment;
  final Function onPressed;
  final Widget child;

  const BottomItem({
    Key key,
    @required this.size,
    @required this.alignment,
    this.onPressed,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      width: screenSize.width,
      bottom: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 48,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: alignment,
                children: [
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
