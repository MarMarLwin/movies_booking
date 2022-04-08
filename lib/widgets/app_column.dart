import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String title;
  final String voteAverage;
  final String voteCount;
  final String releaseDate;
  final String language;
  const AppColumn({Key? key,required this.title,required this.voteAverage,required this.voteCount,required this.releaseDate,required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimension.dimen10/2,
          left: Dimension.dimen10/2,
          right: Dimension.dimen10/2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: title,size: Dimension.dimen20,),
          SizedBox(
            height: Dimension.dimen10,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: AppColors.primaryColor,
                      size: Dimension.dimen10,
                    )),
              ),
              SizedBox(
                width: Dimension.dimen10,
              ),
              SmallText(text: voteAverage),
              SizedBox(
                width: Dimension.dimen30,
              ),

              IconAndText(
                  icon: Icons.supervisor_account,
                  text: voteCount,
                  iconColor: Colors.lightBlue),
            ],
          ),
          SizedBox(
            height: Dimension.dimen10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              IconAndText(
                  icon: Icons.date_range,
                  text: releaseDate,
                  iconColor: Colors.orange),
              SizedBox(width: Dimension.dimen30,),
              IconAndText(
                  icon: Icons.language,
                  text: language,
                  iconColor: Colors.lightBlue),

            ],
          )
        ],
      ),
    );
  }
}
