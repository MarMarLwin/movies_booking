import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String title;
  final String rateText;
  final String commentText;
  final String status;
  final String size;
  final String duration;
  const AppColumn({Key? key,required this.title,required this.rateText,required this.commentText,required this.status,required this.size,required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimension.dimen10,
          left: Dimension.dimen10,
          right: Dimension.dimen10),
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
              SmallText(text: rateText),
              SizedBox(
                width: Dimension.dimen10,
              ),
              SmallText(text: commentText),
              SizedBox(
                width: Dimension.dimen10,
              ),
              SmallText(text: 'comments')
            ],
          ),
          SizedBox(
            height: Dimension.dimen20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              IconAndText(
                  icon: Icons.circle_sharp,
                  text: status,
                  iconColor: Colors.orange),
              IconAndText(
                  icon: Icons.data_usage,
                  text: size,
                  iconColor: Colors.lightBlue),
              IconAndText(
                  icon: Icons.timer,
                  text: duration,
                  iconColor: Colors.red),
            ],
          )
        ],
      ),
    );
  }
}
