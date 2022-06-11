import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_apps/bloc/get_movie_by_id/get_movie_by_id_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.movieTitle})
      : super(key: key);
  final String movieTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movieTitle),
        ),
        body: BlocBuilder<GetMovieByIdCubit, GetMovieByIdState>(
          builder: (context, state) {
            if (state is GetMovieByIdLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetMovieByIdHasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 450,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/original${state.movie.backdropPath}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("overview",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          const SizedBox(height: 5),
                          Text(state.movie.overview,
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is GetMovieByIdError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
