import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_category/get_category_cubit.dart';
import '../bloc/get_movies_by_category/get_movie_by_category_cubit.dart';

class GetCategoryWidget extends StatelessWidget {
  const GetCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      builder: (context, state) {
        if (state is GetCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetCategoryHasData) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButton<String>(
                value: context.watch<GetMovieByCategoryCubit>().selectedGener,
                focusColor: Colors.amber,
                isExpanded: true,
                items: List.generate(
                    state.genres.length,
                    (index) => DropdownMenuItem<String>(
                        child: Text(state.genres[index].name),
                        onTap: () {
                          context
                              .read<GetMovieByCategoryCubit>()
                              .getMovieBycategory(
                                  genre: state.genres[index].id);
                        },
                        value: state.genres[index].name)).toList(),
                onChanged: (String? genre) {
                  if (genre != null) {
                    context.read<GetMovieByCategoryCubit>().selectedGener =
                        genre;
                  }
                }),
          );
        } else if (state is GetCategoryError) {
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
