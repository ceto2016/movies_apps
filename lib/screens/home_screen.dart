import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apps/bloc/get_movies_by_category/get_movie_by_category_cubit.dart';
import 'package:movies_apps/widgets/get_category_widget.dart';

import '../widgets/movies_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies app")),
      body: Column(
        children: const [GetCategoryWidget(), MoviesListWidget()],
      ),
    );
  }
}

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieByCategoryCubit, GetMovieByCategoryState>(
      builder: (context, state) {
        if (state is GetMovieByCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetMovieByCategoryHasData) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) => MovieListViewItem(
                movie: state.movies[index],
              ),
            ),
          );
        } else if (state is GetMovieByCategoryError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
