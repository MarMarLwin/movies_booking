import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/popular_movie_controller.dart';
import 'package:movies/utils/app_constants.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/app_column.dart';
import 'package:movies/widgets/app_icon.dart';
import 'package:movies/widgets/big_text.dart';
import 'package:movies/widgets/expandable_text.dart';
import 'package:movies/widgets/icon_and_text.dart';
import 'package:movies/widgets/small_text.dart';

class PopularMovieDetail extends StatelessWidget {
  int movieId;

  PopularMovieDetail({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movie = Get.find<PopularMovieController>().movieList[movieId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.dimen400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${AppConstant.imageInitUrl}${movie.posterPath}'),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
              top: Dimension.dimen30,
              left: Dimension.dimen10,
              right: Dimension.dimen10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  GestureDetector(
                    child: const AppIcon(icon: Icons.arrow_back_ios),
                      onTap: (){
                        Get.back(closeOverlays: true);
                      }
                  ),
                  const AppIcon(icon: Icons.favorite_border)
                ],
              )),
          Positioned(
              top: Dimension.dimen400 - 20,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.dimen20),
                        topLeft: Radius.circular(Dimension.dimen20)),
                    color: Colors.white),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimension.dimen10,
                      left: Dimension.dimen10,
                      right: Dimension.dimen10,
                      bottom: Dimension.dimen10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        title: movie.title,
                        voteAverage: '${movie.voteAverage}',
                        voteCount: '${movie.voteCount}',
                        releaseDate: movie.releaseDate,
                        language: movie.originalLanguage,
                      ),
                      SizedBox(
                        height: Dimension.dimen10,
                      ),
                      BigText(text: 'Introduced'),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(text: movie.overview),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.dimen110,
        padding: EdgeInsets.only(
            top: Dimension.dimen15,
            bottom: Dimension.dimen15,
            left: Dimension.dimen20,
            right: Dimension.dimen20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.dimen30),
                topRight: Radius.circular(Dimension.dimen30)),
            color: Color(0xFFfff8ff)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: Dimension.dimen50,
              padding: EdgeInsets.only(
                  left: Dimension.dimen20, right: Dimension.dimen20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.dimen20),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.remove, size: Dimension.dimen20),
                  SizedBox(width: Dimension.dimen10),
                  BigText(text: '0'),
                  SizedBox(width: Dimension.dimen10),
                  Icon(Icons.add, size: Dimension.dimen20)
                ],
              ),
            ),
            Container(
              height: Dimension.dimen50,
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: Dimension.dimen10, right: Dimension.dimen10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.dimen15),
                  color: AppColors.primaryColor),
              child: BigText(
                text: ' \$0.5 | Add To Cart',
                color: Colors.white,
                size: Dimension.dimen16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
