import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServeOptionSwitcher extends StatefulWidget {
  const ServeOptionSwitcher({super.key});

  @override
  State<ServeOptionSwitcher> createState() => _ServeOptionSwitcherState();
}

class _ServeOptionSwitcherState extends State<ServeOptionSwitcher> {
  //TODO swap all text with l10n strings

  bool isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SegmentedTabControl(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        indicatorColor: Theme.of(context).colorScheme.primary,
        tabTextColor: Theme.of(context).colorScheme.onSecondary,
        selectedTabTextColor: Theme.of(context).colorScheme.secondary,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        indicatorPadding: const EdgeInsets.all(4),
        tabs: const [
          SegmentTab(
            label: "Order Delivery",
          ),
          SegmentTab(
            label: "In the restaurant",
          ),
        ],
      ),
    )
        .animate()
        .slideY(
          duration: 750.ms,
          begin: -0.1,
          end: 0,
          curve: Curves.easeInOutSine,
        )
        .fadeIn(
          duration: 750.ms,
        );
  }
}
