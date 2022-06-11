import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apps/bloc/get_category/get_category_cubit.dart';

import 'package:movies_apps/bloc/get_movies_by_category/get_movie_by_category_cubit.dart';
import 'bloc/get_movie_by_id/get_movie_by_id_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<GetCategoryCubit>(
              create: (BuildContext context) => GetCategoryCubit()..getGenres(),
            ),
            BlocProvider<GetMovieByCategoryCubit>(
                create: (BuildContext context) =>
                    GetMovieByCategoryCubit()..getMovieBycategory(genre: 28)),
            BlocProvider<GetMovieByIdCubit>(
                create: (BuildContext context) => GetMovieByIdCubit()),
          ],
          child: const HomePage(),
        ));
  }
}
