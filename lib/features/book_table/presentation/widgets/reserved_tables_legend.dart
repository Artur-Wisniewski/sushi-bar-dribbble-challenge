import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/reserved_table_legend_item.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class ReservedTablesLegend extends StatelessWidget {
  const ReservedTablesLegend({super.key, this.animationDelay = const Duration(milliseconds: 500)});

  final Duration animationDelay;

  Duration get animationDuration => 700.ms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 16, 8),
      child: Row(
        children: [
          ReservedTableLegendItem(
            label: L10n.current.reserved,
            color: const Color(0xFF404e9a),
          ),
          const Gap(16),
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
