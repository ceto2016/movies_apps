import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apps/bloc/get_movie_by_id/get_movie_by_id_cubit.dart';
import 'package:movies_apps/models/movie.dart';

import '../screens/movie_details_screen.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read<GetMovieByIdCubit>().getmoviebyidCubit(movieId: movie.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                      value: GetMovieByIdCubit()
                        ..getmoviebyidCubit(movieId: movie.id),
                      child: MovieDetailsScreen(movieTitle: movie.title),
                    )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/original${movie.backdropPath}",
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(.8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 10),
                    Text(movie.voteAverage.toString(),
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.8),
                      ),
                      child: Text(
                        movie.title.length > 20
                            ? movie.title.substring(0, 20)
                            : movie.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
