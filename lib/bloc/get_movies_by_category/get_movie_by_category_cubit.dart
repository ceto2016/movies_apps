import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_apps/models/movie.dart';

part 'get_movie_by_category_state.dart';

class GetMovieByCategoryCubit extends Cubit<GetMovieByCategoryState> {
  GetMovieByCategoryCubit() : super(GetMovieByCategoryInitial());
  String selectedGener = "Action";
  Future<void> getMovieBycategory({required int genre}) async {
    emit(GetMovieByCategoryLoading());
    try {
      List<Movie> movies = [];
      final response = await Dio().get(
          'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=12&with_genres=$genre');
      movies = List<Movie>.from(
          response.data["results"].map((e) => Movie.fromJson(e)));
      emit(GetMovieByCategoryHasData(movies: movies));
    } catch (e) {
      emit(GetMovieByCategoryError(errorMessage: "something went wrong"));
    }
  }
}
