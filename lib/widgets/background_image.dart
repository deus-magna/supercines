import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key key,
    this.backgroundImage,
    this.color = backgroundPurple,
    this.opacity = 1,
    @required this.animatedOpacity,
  }) : super(key: key);

  final String backgroundImage;
  final Color color;
  final double opacity;
  final double animatedOpacity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          backgroundImage == null ? Container() : _buildAnimatedOpacity(),
          _buildCoverColor(color, opacity),
          _buildGradientRect(size),
          _buildBottomGradientRect(size),
        ],
      ),
    );
  }

  Widget _buildAnimatedOpacity() {
    return AnimatedOpacity(
      opacity: animatedOpacity,
      duration: Duration(milliseconds: animatedOpacity == 0.0 ? 750 : 500),
      curve: animatedOpacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Container(
        height: double.infinity,
        child: Image(
          image: NetworkImage(backgroundImage),
          fit: BoxFit.cover,
        ),
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

  Container _buildCoverColor(Color color, double opacity) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
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
