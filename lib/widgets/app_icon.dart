import 'package:flutter/material.dart';
import 'package:movies/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.size = 40,
      this.iconColor = const Color(0xFF756d54),
      this.backgroundColor = const Color(0xFFfcf4e4)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(icon,color: iconColor,size: Dimension.dimen16),
    );
  }
}
