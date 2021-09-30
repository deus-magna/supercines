import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:supercines/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  final Function(int) onIndexChanged;

  CardSwiper({required this.movies, required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      height: _screenSize.height * 0.30,
      child: Swiper(
        onIndexChanged: onIndexChanged,
        itemBuilder: (BuildContext context, int index) {
          return Hero(
            tag: movies[index].id ?? 0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(movies[index].getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                )),
          );
        },
        itemCount: movies.length,
        viewportFraction: 0.4,
        scale: 0.6,
      ),
    );
  }
}
