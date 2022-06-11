part of 'get_movie_by_id_cubit.dart';

@immutable
abstract class GetMovieByIdState {}

class GetMovieByIdInitial extends GetMovieByIdState {}

class GetMovieByIdLoading extends GetMovieByIdState {}

class GetMovieByIdHasData extends GetMovieByIdState {
  final Movie movie;
  GetMovieByIdHasData({required this.movie});
}

class GetMovieByIdError extends GetMovieByIdState {
  final String errorMessage;
  GetMovieByIdError({required this.errorMessage});
}
