part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class AllMovieFetchedState extends MovieState {
 final Future<List<MovieModel>> movies;

  AllMovieFetchedState({required this.movies});
}
