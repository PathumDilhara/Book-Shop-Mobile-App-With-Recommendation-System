import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color color;
  final double width;
  final double height;
  const SvgIcon({
    super.key,
    required this.icon,
    required this.color,
    this.width = 26,
    this.height = 26,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
