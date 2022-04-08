import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/popular_movie_controller.dart';
import 'package:movies/models/result.dart';
import 'package:movies/pages/movies/popular_movies_deail.dart';
import 'package:movies/pages/movies/recommended_movies_detail.dart';
import 'package:movies/utils/app_constants.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/utils/route_helper.dart';
import 'package:movies/widgets/app_column.dart';
import 'package:movies/widgets/big_text.dart';
import 'package:movies/widgets/icon_and_text.dart';
import 'package:movies/widgets/small_text.dart';

class MoviesHomePage extends StatefulWidget {
  static const String routeName = '/MovieHome';

  const MoviesHomePage({Key? key}) : super(key: key);

  @override
  State<MoviesHomePage> createState() => _MoviesHomePageState();
}

class _MoviesHomePageState extends State<MoviesHomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimension.dimen300;

  @override
  void initState() {
    debugPrint('width' + Dimension.screenWidth.toString());
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(Dimension.dimen10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  child: BigText(
                    text: 'Popular Movies',
                  ),
                  alignment: Alignment.centerLeft,
                ),
                // slider selection
                GetBuilder<PopularMovieController>(
                  builder: (popularMovie) {
                    return SizedBox(
                      height: Dimension.dimen400,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: popularMovie.movieList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(
                              position, popularMovie.movieList[position]);
                        },
                      ),
                    );
                  },
                ),
                // dots
                /* GetBuilder<PopularMovieController>(builder: (popularMovie){
                  return DotsIndicator(
                    dotsCount: popularMovie.movieList.isEmpty?1: popularMovie.movieList.length,
                    position: _currentPageValue,
                    decorator: DotsDecorator(
                      activeColor: AppColors.primaryColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  );
                }),*/
                // upcoming movies
                SizedBox(height: Dimension.dimen20),
                Align(
                  child: BigText(text: 'Upcoming Movies'),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: Dimension.dimen10,
                ),
                // list of movies and images
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.recommendedMovie);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: Dimension.dimen10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // image
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimension.dimen20),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/images/img2.jpg'),
                                      fit: BoxFit.cover),
                                ),
                                width: Dimension.dimen110,
                                height: Dimension.dimen110,
                              ),

                              // text
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Dimension.dimen20),
                                        bottomRight:
                                            Radius.circular(Dimension.dimen20)),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(Dimension.dimen10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      BigText(
                                          text:
                                              'Fantastic Beats: The Secrets of Dumbledore'),
                                      SizedBox(height: Dimension.dimen10),
                                      SmallText(
                                          text:
                                              'In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.'),
                                      SizedBox(
                                        height: Dimension.dimen10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconAndText(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: Colors.orange),
                                          IconAndText(
                                              icon: Icons.data_usage,
                                              text: '910 kb',
                                              iconColor: Colors.lightBlue),
                                          IconAndText(
                                              icon: Icons.timer,
                                              text: '52 min',
                                              iconColor: Colors.red),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            )),
      ),
    ));
  }

  Widget _buildPageItem(int position, Results popularMovie) {
    Matrix4 matrix = Matrix4.identity();
    if (position == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currScale = _scaleFactor +
          (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor), 1);
    }
    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopularMovie(position));
        },
        child: Stack(children: [
          //image container
          Container(
            height: _height,
            margin: EdgeInsets.only(
                right: Dimension.dimen10 / 2, left: Dimension.dimen10 / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryColor,
                image: DecorationImage(
                    image: NetworkImage(
                        '${AppConstant.imageInitUrl}${popularMovie.posterPath}'),
                    fit: BoxFit.cover)),
          ),
          // rating and label
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimension.dimen30,
                    right: Dimension.dimen30,
                    bottom: Dimension.dimen30),
                height: Dimension.dimen110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.dimen20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ]),
                child: AppColumn(
                  title: popularMovie.title,
                  voteAverage: popularMovie.voteAverage.toString(),
                  voteCount: popularMovie.voteCount.toString(),
                  releaseDate: popularMovie.releaseDate,
                  language: popularMovie.originalLanguage,
                )),
          )
        ]),
      ),
    );
  }
}
