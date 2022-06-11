import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import '../../models/genre.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit() : super(GetCategoryInitial());

  Future<void> getGenres() async {
    emit(GetCategoryLoading());
    try {
      List<Genre> genres = [];
      final response = await Dio().get(
          'https://api.themoviedb.org/3/genre/movie/list?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9');
      genres = List<Genre>.from(
          response.data["genres"].map((e) => Genre.fromJson(e)));
      emit(GetCategoryHasData(genres: genres));
    } catch (e) {
      emit(GetCategoryError(errorMessage: "something went wrong"));
    }
  }
}
