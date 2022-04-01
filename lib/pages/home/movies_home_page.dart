import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/app_column.dart';
import 'package:movies/widgets/big_text.dart';
import 'package:movies/widgets/icon_and_text.dart';
import 'package:movies/widgets/small_text.dart';

class MoviesHomePage extends StatefulWidget {
  const MoviesHomePage({Key? key}) : super(key: key);

  @override
  State<MoviesHomePage> createState() => _MoviesHomePageState();
}

class _MoviesHomePageState extends State<MoviesHomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimension.dimen200;

  @override
  void initState() {
    debugPrint('width'+Dimension.screenWidth.toString());
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
                SizedBox(
                  height: Dimension.dimen300,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position);
                    },
                  ),
                ),
                // dots
                DotsIndicator(
                  dotsCount: 5,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.primaryColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                // upcoming movies
                SizedBox(height: Dimension.dimen20),
                Align(child: BigText(text: 'Upcoming Movies'),alignment: Alignment.centerLeft,),
                SizedBox(height: Dimension.dimen10,),
                // list of movies and images
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Container(
                       margin:  EdgeInsets.only(bottom: Dimension.dimen10),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // image
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimension.dimen20),
                                color: Colors.white,
                                image:const DecorationImage(image:  AssetImage('assets/images/img2.jpg'),fit: BoxFit.cover),
                              ),
                              width: Dimension.dimen110,
                              height: Dimension.dimen110,
                            ),

                            // text
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimension.dimen20),bottomRight: Radius.circular(Dimension.dimen20)),
                               color: Colors.white,
                                ),
                                padding: EdgeInsets.all(Dimension.dimen10),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.stretch,
                                  children: [
                                    BigText(text: 'Fantastic Beats: The Secrets of Dumbledore'),
                                    SizedBox(height: Dimension.dimen10),
                                    SmallText(text: 'In an effort to thwart Grindelwald\'s plans of raising purse-blood wizards to rule over all non-magical beings.'),
                                   SizedBox(height: Dimension.dimen10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      );
                    })
              ],
            )),
      ),
    ));
  }

  Widget _buildPageItem(int position) {
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
                  image: AssetImage('assets/images/img1.jpg'),
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
            child: AppColumn(title: 'Spider-Man: No Way Home',rateText: '4.5',commentText: '1289',status: 'Normal',size: '910 kb',duration: '52 mins',)
          ),
        )
      ]),
    );
  }
}
