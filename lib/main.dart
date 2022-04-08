import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movies/controller/popular_movie_controller.dart';
import 'package:movies/pages/home/movies_home_page.dart';
import 'package:movies/pages/movies/popular_movies_deail.dart';
import 'package:movies/pages/movies/recommended_movies_detail.dart';
import 'package:movies/utils/route_helper.dart';
import 'helper/dependencies.dart' as dependency;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularMovieController>().getPopularMovieList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MoviesHomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes ,
      /*routes: {
        PopularMovieDetail.routeName:(context)=>const PopularMovieDetail(),
        RecommendedMovieDetail.routeName:(context)=>const RecommendedMovieDetail(),
      },*/
    );
  }
}
