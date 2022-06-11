part of 'get_category_cubit.dart';

@immutable
abstract class GetCategoryState {}

class GetCategoryInitial extends GetCategoryState {}

class GetCategoryLoading extends GetCategoryState {}

class GetCategoryHasData extends GetCategoryState {
  final List<Genre> genres;
  GetCategoryHasData({required this.genres});
}

class GetCategoryError extends GetCategoryState {
  final String errorMessage;
  GetCategoryError({required this.errorMessage});
}
