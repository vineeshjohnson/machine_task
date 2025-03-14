import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_app/features/movies/data/models/movie_model.dart';
import 'package:user_app/features/movies/domain/repositories/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<AllMovieFetchingEvent>((event, emit) {
      emit(AllMovieFetchedState(movies: getMovies(event.pageNumber)));
    });
  }
}

Future<List<MovieModel>> getMovies(int pagenumber) {
  MovieRepository movieRepository = MovieRepository();
  return movieRepository.fetchMovies(pagenumber);
}
