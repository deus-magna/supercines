class Movies {
  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    for (final item in jsonList) {
      final pelicula = Movie.fromJsonMap(item);
      items.add(pelicula);
    }
  }

  List<Movie> items = [];
}

class Movie {
  Movie({
    this.voteCount,
    this.popularity,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    popularity = json['popularity'] / 1;
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'] / 1;
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  double? popularity;
  int? voteCount;
  bool? video;
  String? posterPath;
  int? id;
  bool? adult;
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? title;
  double? voteAverage;
  String? overview;
  String? releaseDate;

  String getPosterImg() {
    if (posterPath == null) {
      return 'http://www.independentmediators.co.uk/wp-content/uploads/2016/02/placeholder-image.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  String getYear() {
    return releaseDate == null ? '--' : releaseDate!.substring(0, 4);
  }
}
