import 'package:flutter/material.dart';
import 'package:supercines/framework/custom_icons.dart';
import 'package:supercines/models/actores_model.dart';
import 'package:supercines/models/genre_model.dart';
import 'package:supercines/models/movie_model.dart';
import 'package:supercines/services/movies_service.dart';
import 'package:supercines/widgets/background_image.dart';
import 'package:supercines/widgets/bottom_item.dart';
import 'package:supercines/widgets/card_swiper_widget.dart';
import 'package:supercines/widgets/custom_app_bar.dart';
import 'package:supercines/widgets/movie_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final moviesService = MoviesService();
  final _avatar =
      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg';
  List<Movie> movies = [];
  List<Genre> genres = [];
  List<Actor> actors = [];
  Movie? selectedMovie;
  late bool _isLoading;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  Future<void> _getMovies() async {
    setState(() => _isLoading = true);
    movies = await moviesService.getEnCines();
    selectedMovie = movies.first;

    genres = await moviesService.getGenreList();
    actors = await moviesService.getCast(selectedMovie!.id.toString());
    _opacity = 1.0;
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(
            backgroundImage:
                selectedMovie != null ? selectedMovie!.getPosterImg() : null,
            opacity: 0.75,
            animatedOpacity: _opacity,
          ),
          _buildMovieContent(context, size),
          const BottomItem(
            size: 36,
            alignment: MainAxisAlignment.start,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36,
            ),
          ),
          const BottomItem(
            size: 48,
            alignment: MainAxisAlignment.center,
            child: Icon(
              CustomIcons.popcorn,
              color: Colors.white,
              size: 48,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieContent(BuildContext context, Size size) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            CustomAppBar(avatar: _avatar),
            SizedBox(height: size.height * 0.17),
            if (_isLoading)
              const SizedBox.shrink()
            else
              MovieDetails(
                genres: genres,
                actors: actors,
                movie: selectedMovie!,
                opacity: _opacity,
              ),
            _cardsSwiper(),
          ],
        ),
      ),
    );
  }

  Widget _cardsSwiper() {
    return _isLoading
        ? const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : CardSwiper(
            movies: movies,
            onIndexChanged: _onMovieChanged,
          );
  }

  Future<void> _onMovieChanged(int index) async {
    setState(() {
      _opacity = 0.0;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      selectedMovie = movies[index];
      _opacity = 1.0;
      _getActors();
    });
  }

  Future<void> _getActors() async {
    actors = await moviesService.getCast(selectedMovie!.id.toString());
  }
}
