import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/managers/shopping_cart_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServeOptionSwitcher extends StatefulWidget {
  const ServeOptionSwitcher({
    super.key,
    required this.onSwitch,
    required this.initialOrderType,
    required this.exitAnimationController,
    required this.animationDuration,
  });

  final Function(OrderType orderType) onSwitch;
  final AnimationController exitAnimationController;
  final OrderType initialOrderType;
  final Duration animationDuration;

  @override
  State<ServeOptionSwitcher> createState() => _ServeOptionSwitcherState();
}

class _ServeOptionSwitcherState extends State<ServeOptionSwitcher> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialOrderType == OrderType.delivery ? 0 : 1,
    );
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        widget.onSwitch(OrderType.delivery);
      } else {
        widget.onSwitch(OrderType.table);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedTabControl(
      controller: _tabController,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      indicatorColor: Theme.of(context).colorScheme.primary,
      tabTextColor: Theme.of(context).colorScheme.onSecondary,
      selectedTabTextColor: Theme.of(context).colorScheme.secondary,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      indicatorPadding: const EdgeInsets.all(4),
      tabs: [
        SegmentTab(
          label: L10n.current.orderDelivery,
        ),
        SegmentTab(
          label: L10n.current.inTheRestaurant,
        ),
      ],
    )
        .animate()
        .slideY(
          duration: widget.animationDuration,
          begin: -0.2,
          end: 0,
          curve: Curves.easeInOutSine,
        )
        .fadeIn(
          duration: widget.animationDuration,
        )
        .animate(
          controller: widget.exitAnimationController,
          autoPlay: false,
        )
        .slideY(
          duration: widget.animationDuration,
          begin: 0.0,
          end: -0.2,
          curve: Curves.easeInOutSine,
        )
        .fadeOut(
          duration: widget.animationDuration,
        );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
