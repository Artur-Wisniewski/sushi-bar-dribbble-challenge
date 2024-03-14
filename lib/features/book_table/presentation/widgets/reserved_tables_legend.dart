import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/reserved_table_legend_item.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ReservedTablesLegend extends StatelessWidget {
  const ReservedTablesLegend({super.key, this.animationDelay = const Duration(milliseconds: 500)});

  final Duration animationDelay;

  Duration get animationDuration => 700.ms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.mediumAllBottomSmall,
      child: Row(
        children: [
          ReservedTableLegendItem(
            label: L10n.current.reserved,
            color: AppColors.indigo,
          ),
          Gaps.medium,
          ReservedTableLegendItem(
            label: L10n.current.free,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          duration: animationDuration,
          delay: animationDelay,
          curve: Curves.easeInOutSine,
        )
        .slideY(
          begin: -0.4,
          end: 0,
          duration: animationDuration,
          delay: animationDelay,
          curve: Curves.easeInOutSine,
        );
  }
}
