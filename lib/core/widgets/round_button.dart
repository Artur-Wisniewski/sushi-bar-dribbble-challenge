import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    required this.size,
    required this.iconSize,
    this.isPrimary = true,
  });

  const RoundIconButton.primary({
    super.key,
    required this.icon,
    this.onPressed,
  })  : size = 44,
        iconSize = 26,
        isPrimary = true;

  const RoundIconButton.secondary({
    super.key,
    required this.icon,
    this.onPressed,
  })  : size = 24,
        iconSize = 16,
        isPrimary = false;

  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final color = isPrimary ? Theme.of(context).colorScheme.primary : Theme.of(context).scaffoldBackgroundColor;
    final border = isPrimary
        ? Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 2,
          )
        : null;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: border,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
