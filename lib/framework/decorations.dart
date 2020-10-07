import 'package:flutter/material.dart';

var gradientRect =
    ({@required Color first, @required Color second}) => BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [first, second],
          ),
        );

var imageDecoration = (String backgroundImage) => BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(backgroundImage),
        fit: BoxFit.cover,
      ),
    );
