part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class AllMovieFetchingEvent extends MovieEvent {
  final int pageNumber;

  AllMovieFetchingEvent({required this.pageNumber});
}
