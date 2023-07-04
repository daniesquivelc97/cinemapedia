import '../entities/movie.dart';

abstract class MovierRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
