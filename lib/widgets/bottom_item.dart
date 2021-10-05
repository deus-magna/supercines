import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key? key,
    required this.size,
    required this.alignment,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  final double size;
  final MainAxisAlignment alignment;
  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      width: screenSize.width,
      bottom: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: GestureDetector(
            onTap: onPressed,
            child: SizedBox(
              height: 48,
              child: Row(
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
