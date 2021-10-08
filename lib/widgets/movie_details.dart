import 'package:flutter/material.dart';
import 'package:supercines/framework/framework.dart';
import 'package:supercines/models/actores_model.dart';
import 'package:supercines/models/genre_model.dart';
import 'package:supercines/models/movie_model.dart';
import 'package:supercines/screens/tickets_screen.dart';
import 'package:supercines/utils/utils.dart' as utils;
import 'package:supercines/widgets/trailer_button.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    Key? key,
    required this.genres,
    required this.actors,
    required this.movie,
    required this.opacity,
  }) : super(key: key);

  final List<Genre> genres;
  final List<Actor> actors;
  final Movie movie;
  final double opacity;

  static const _duration = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildActions(),
        const SizedBox(height: 5),
        _buildMovieTitle(context),
        const SizedBox(height: 10),
        _buildMovieDetails(),
        const SizedBox(height: 15),
        _buildBuyTicketsButton(context),
        const SizedBox(height: 28),
        _buildMovieCast(),
      ],
    );
  }

  Widget _buildMovieCast() {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          utils.getActors(actors),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Crea el boton que se utiliza para comprar tickets para ver la pelicula.
  Widget _buildBuyTicketsButton(BuildContext context) {
    final raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: yellow,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.062,
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: ElevatedButton(
        style: raisedButtonStyle,
        child: const Text(
          'BUY TICKETS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () => _pushMovieDetail(context),
      ),
    );
  }

  void _pushMovieDetail(BuildContext context) {
    Navigator.of(context).push<void>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: TicketsScreen(
              movie: movie,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  Widget _buildMovieDetails() {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              movie.getYear(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Text(
              '   ⬤   ',
              style: TextStyle(
                color: yellow,
                fontSize: 6,
              ),
            ),
            Flexible(
              child: Text(
                utils.getGenresFromId(movie.genreIds, genres),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Crea el titulo de la pelicula
  Widget _buildMovieTitle(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: _duration,
      curve: opacity == 0.0 ? Curves.easeOut : Curves.easeIn,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.07389,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          movie.title!.toUpperCase(),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Row _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        TrailerButton(),
        Text(
          'ABOUT MOVIE',
          style: TextStyle(color: yellow, fontSize: 12),
        )
      ],
    );
  }
}
