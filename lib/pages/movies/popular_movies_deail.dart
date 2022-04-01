import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/app_column.dart';
import 'package:movies/widgets/app_icon.dart';
import 'package:movies/widgets/big_text.dart';
import 'package:movies/widgets/expandable_text.dart';
import 'package:movies/widgets/icon_and_text.dart';
import 'package:movies/widgets/small_text.dart';

class PopularMovieDetail extends StatelessWidget {
  const PopularMovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: Dimension.dimen350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/img1.jpg'),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
              top: Dimension.dimen30,
              left: Dimension.dimen10,
              right: Dimension.dimen10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.favorite_border)
                ],
              )),
          Positioned(
              top: Dimension.dimen350 - 20,
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
                        title: 'Spider-Man: No Way Home',
                        rateText: '4.5',
                        commentText: '1289',
                        status: 'Normal',
                        size: '910 kb',
                        duration: '52 mins',
                      ),
                      SizedBox(
                        height: Dimension.dimen10,
                      ),
                      BigText(text: 'Introduced'),
                      ExpandableText(
                          text:
                              'In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.')
                    ],
                  ),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimension.dimen110,
        padding: EdgeInsets.only(top: Dimension.dimen15,bottom: Dimension.dimen15,left: Dimension.dimen20,right: Dimension.dimen20),
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
              padding: EdgeInsets.only(left: Dimension.dimen20,right: Dimension.dimen20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.dimen20),
                  color: Colors.white),
              child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.remove,size: Dimension.dimen20),
                  SizedBox(width: Dimension.dimen10),
                  BigText(text: '0'),
                  SizedBox(width: Dimension.dimen10),
                  Icon(Icons.add,size: Dimension.dimen20)
                ],
              ),
            ),
            Container(
              height: Dimension.dimen50,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: Dimension.dimen10,right: Dimension.dimen10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.dimen20),
                  color: AppColors.primaryColor),
              child: BigText(text: ' \$0.5 | Add To Cart',color: Colors.white,size: Dimension.dimen16,),
            )
          ],
        ),
      ),
    );
  }
}
