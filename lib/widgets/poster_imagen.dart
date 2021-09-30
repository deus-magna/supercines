import 'package:flutter/material.dart';
import 'package:supercines/models/movie_model.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    Key? key,
    required Movie movie,
    this.padding = 18.0,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: _buildContent(size),
    );
  }

  Widget _buildContent(Size size) {
    return Row(
      children: [
        _buildImageContainer(size),
        SizedBox(width: 10),
        _buildMovieTitle(),
      ],
    );
  }

  Widget _buildMovieTitle() {
    return Expanded(
      child: Text(
        _movie.title!.toUpperCase(),
        maxLines: 2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildImageContainer(Size size) {
    return Hero(
      tag: _movie.id ?? 0,
      child: Container(
        width: 54,
        height: size.height * 0.085,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: FadeInImage(
            image: NetworkImage(_movie.getPosterImg()),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
