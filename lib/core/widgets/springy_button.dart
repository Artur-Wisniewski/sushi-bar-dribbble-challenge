import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SpringyButton extends StatefulWidget {
  const SpringyButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  State<SpringyButton> createState() => _SpringyButtonState();
}

class _SpringyButtonState extends State<SpringyButton> with TickerProviderStateMixin {
  late final AnimationController scaleController = AnimationController(vsync: this);

  Duration get scaleDuration => 150.ms;

  Duration get scaleDownDelay => scaleDuration;

  Offset get scaleEndOffset => const Offset(0.92, 0.92);

  Offset get scaleBeginOffset => const Offset(1, 1);

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        scaleController.forward();
      },
      onTapUp: (_) {
        scaleController.reverse().then((value) => widget.onPressed.call());
      },
      child: widget.child,
    )
        .animate(
          autoPlay: false,
          controller: scaleController,
        )
        .scale(
          duration: scaleDuration,
          begin: scaleBeginOffset,
          end: scaleEndOffset,
        );
  }
}
