import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/core/common/colors.dart';
import 'package:user_app/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:user_app/features/movies/presentation/screens/movie_detail_screen.dart';
import 'package:user_app/features/movies/presentation/widgets/movie_card_widget.dart';
import 'package:user_app/features/user/presentation/widgets/headding_widget.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int pageNumber = 1;
    return BlocProvider(
      create: (context) =>
          MovieBloc()..add(AllMovieFetchingEvent(pageNumber: pageNumber)),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AllColors().textColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  HeaddingWidget(title: 'All Movies'),
                  Expanded(
                    child: state is AllMovieFetchedState
                        ? FutureBuilder(
                            future: state.movies,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text('No movies found.'));
                              } else {
                                return GridView.builder(
                                  itemCount: snapshot.data!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: .5,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 15,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    final movie = snapshot.data![index];
                                    return GestureDetector(
                                      child: MovieCardWidget(movie: movie),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailsScreen(
                                                        movie: movie)));
                                      },
                                    );
                                  },
                                );
                              }
                            },
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      pageNumber > 1
                          ? GestureDetector(
                              child: Text(
                                'Previouse',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                pageNumber--;
                                context.read<MovieBloc>().add(
                                    AllMovieFetchingEvent(
                                        pageNumber: pageNumber));
                              },
                            )
                          : SizedBox(),
                      GestureDetector(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          pageNumber++;
                          context.read<MovieBloc>().add(
                              AllMovieFetchingEvent(pageNumber: pageNumber));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
