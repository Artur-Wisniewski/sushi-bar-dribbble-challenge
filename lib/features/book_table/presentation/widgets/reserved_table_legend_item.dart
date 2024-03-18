import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:flutter/material.dart';

class ReservedTableLegendItem extends StatelessWidget {
  const ReservedTableLegendItem({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  double get size => 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadii.small,
          ),
        ),
        Gaps.small,
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
