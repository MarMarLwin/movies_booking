import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/app_icon.dart';
import 'package:movies/widgets/big_text.dart';
import 'package:movies/widgets/expandable_text.dart';
import 'package:movies/widgets/small_text.dart';

class RecommendedMovieDetail extends StatelessWidget {
  const RecommendedMovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(child: AppIcon(icon: Icons.arrow_back_ios),
                onTap: (){
                  Get.back(closeOverlays: true);
                },),
                AppIcon(icon: Icons.favorite_border)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimension.dimen30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimension.dimen30),topLeft: Radius.circular(Dimension.dimen30))
                ),

                child: BigText(
                  text: 'Spider Man - No Way Home',
                  color: AppColors.primaryColor,
                ),
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    top: Dimension.dimen10 / 2, bottom: Dimension.dimen10),
              ),
            ),
            backgroundColor: AppColors.primaryColor,
            shadowColor: Colors.transparent,
            expandedHeight: Dimension.dimen200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/img2.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ExpandableText(
                text:
                    'In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.'),
          )
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Container(
           padding: EdgeInsets.only(left: Dimension.dimen50,right: Dimension.dimen50,top: Dimension.dimen15,bottom: Dimension.dimen15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               AppIcon(icon: Icons.remove,backgroundColor: AppColors.primaryColor,iconColor: Colors.white,),
               BigText(text: '\$12.88 X 0'),
               AppIcon(icon: Icons.add,backgroundColor: AppColors.primaryColor,iconColor: Colors.white,),
             ],
           ),

         ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimension.dimen20),topRight: Radius.circular(Dimension.dimen20)),
              color: Colors.white
            ),
            padding: EdgeInsets.all( Dimension.dimen20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child:Icon(Icons.favorite_border,color: AppColors.primaryColor),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.dimen10),
                    color: Colors.white
                  ),
                  padding: EdgeInsets.all(Dimension.dimen15),
                ),
                Container(
                  height: Dimension.dimen50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: Dimension.dimen10,right: Dimension.dimen10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.dimen15),
                      color: AppColors.primaryColor),
                  child: BigText(text: ' \$0.5 | Add To Cart',color: Colors.white,size: Dimension.dimen16,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
