import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OverlayAnimatedBadge extends StatefulWidget {
  const OverlayAnimatedBadge({super.key, required this.counter, required this.child});

  final int counter;
  final Widget child;

  @override
  State<OverlayAnimatedBadge> createState() => _OverlayAnimatedBadgeState();
}

class _OverlayAnimatedBadgeState extends State<OverlayAnimatedBadge> with TickerProviderStateMixin {
  final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> showBadgeNotifier = ValueNotifier<bool>(false);

  bool showBadge = true;
  int currentCounter = 0;

  @override
  void initState() {
    currentCounter = widget.counter;
    showBadge = widget.counter > 0;
    super.initState();
  }

  @override
  void didUpdateWidget(OverlayAnimatedBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.counter != widget.counter) {
      _updateBadge();
    }
  }

  void _updateBadge() {
    setState(() {
      showBadge = 0 < widget.counter;
      if (showBadge) {
        currentCounter = widget.counter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child,
        Positioned(
          left: 8,
          top: -10,
          child: AnimatedOpacity(
            opacity: showBadge ? 1 : 0,
            duration: 300.ms,
            child: AnimatedScale(
              scale: showBadge ? 1 : 0,
              duration: 300.ms,
              curve: Curves.easeInOutBack,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedSize(
                  duration: 300.ms,
                  child: AnimatedSwitcher(
                    duration: 150.ms,
                    layoutBuilder: (currentChild, previousChildren) => currentChild!,
                    child: Text(
                      currentCounter.toString(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            height: 1,
                          ),
                      key: ValueKey<int>(currentCounter),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
