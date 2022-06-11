import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_apps/models/movie.dart';

part 'get_movie_by_id_state.dart';

class GetMovieByIdCubit extends Cubit<GetMovieByIdState> {
  GetMovieByIdCubit() : super(GetMovieByIdInitial());
  Future<void> getmoviebyidCubit({required int movieId}) async {
    emit(GetMovieByIdLoading());
    try {
      Movie? movie;
      final response = await Dio().get(
          "https://api.themoviedb.org/3/movie/$movieId?api_key=2001486a0f63e9e4ef9c4da157ef37cd");
      movie = Movie.fromJson(response.data);
      emit(GetMovieByIdHasData(movie: movie));
    } catch (e) {
      emit(GetMovieByIdError(errorMessage: "something went wrong"));
    }
  }
}
