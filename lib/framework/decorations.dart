import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';

BoxDecoration gradientRect({required Color first, required Color second}) =>
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [first, second],
      ),
    );

BoxDecoration imageDecoration(String backgroundImage) => BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(backgroundImage),
        fit: BoxFit.cover,
      ),
    );

BoxDecoration roundedDecoration(bool selected) => BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: selected ? yellow : deepBlue,
    );

BoxDecoration outlineDecoration(bool selected) => BoxDecoration(
      border: Border.all(
        color: selected ? yellow : Colors.white.withOpacity(0.25),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
    );
