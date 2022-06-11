part of 'get_movie_by_category_cubit.dart';

@immutable
abstract class GetMovieByCategoryState {}

class GetMovieByCategoryInitial extends GetMovieByCategoryState {}

class GetMovieByCategoryLoading extends GetMovieByCategoryState {}

class GetMovieByCategoryHasData extends GetMovieByCategoryState {
  final List<Movie> movies;
  GetMovieByCategoryHasData({
    required this.movies,
  });
}

class GetMovieByCategoryError extends GetMovieByCategoryState {
  final String errorMessage;
  GetMovieByCategoryError({required this.errorMessage});
}
