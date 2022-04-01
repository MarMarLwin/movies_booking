import 'package:flutter/material.dart';
import 'package:movies/utils/dimensions.dart';
import 'package:movies/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimension.dimen20,
        ),
        SizedBox(
          width: Dimension.dimen10 / 2,
        ),
        SmallText(text: text)
      ],
    );
  }
}
