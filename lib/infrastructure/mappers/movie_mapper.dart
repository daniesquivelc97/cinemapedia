import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
        adult: movieDB.adult,
        backdropPath: movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
        id: movieDB.id,
        originalLanguage: movieDB.originalLanguage,
        originalTitle: movieDB.originalTitle,
        overview: movieDB.overview,
        popularity: movieDB.popularity,
        posterPath: movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
            : 'https://www.csaff.org/wp-content/uploads/csaff-no-poster.jpg',
        releaseDate:
            movieDB.releaseDate != null ? movieDB.releaseDate! : DateTime.now(),
        title: movieDB.title,
        video: movieDB.video,
        voteAverage: movieDB.voteAverage,
        voteCount: movieDB.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
        adult: movieDB.adult,
        backdropPath: movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: movieDB.genres.map((e) => e.name).toList(),
        id: movieDB.id,
        originalLanguage: movieDB.originalLanguage,
        originalTitle: movieDB.originalTitle,
        overview: movieDB.overview,
        popularity: movieDB.popularity,
        posterPath: movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        releaseDate: movieDB.releaseDate,
        title: movieDB.title,
        video: movieDB.video,
        voteAverage: movieDB.voteAverage,
        voteCount: movieDB.voteCount,
      );
}
