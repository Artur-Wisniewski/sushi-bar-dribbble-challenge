import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.path, {
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final String path;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
