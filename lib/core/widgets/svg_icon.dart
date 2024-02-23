import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.path, {
    super.key,
    required this.size,
    this.isHighlighted = false,
  });

  final double size;
  final String path;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(
        isHighlighted
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onBackground,
        BlendMode.srcIn,
      )
    );
  }
}
