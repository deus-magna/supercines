import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
    @required this.backgroundImage,
  }) : super(key: key);

  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: backgroundImage != null
          ? imageDecoration(backgroundImage)
          : BoxDecoration(),
      child: Stack(
        children: [
          _buildGradientRect(size),
          _buildBottomGradientRect(size),
          _buildCoverColor(),
        ],
      ),
    );
  }

  Positioned _buildBottomGradientRect(Size size) {
    return Positioned(
      width: size.width,
      height: size.height * 0.15,
      bottom: 0,
      child: Container(
        decoration: gradientRect(
          first: Colors.transparent,
          second: gradientBlue,
        ),
      ),
    );
  }

  Container _buildCoverColor() {
    return Container(
      decoration: BoxDecoration(
        color: backgroundPurple.withOpacity(0.75),
      ),
    );
  }

  Container _buildGradientRect(Size size) {
    return Container(
      decoration: gradientRect(
        first: gradientBlue,
        second: Colors.transparent,
      ),
      height: size.height * 0.15,
    );
  }
}
