import 'package:dribbble_sushi_bar_challenge/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBottomBarItem extends StatefulWidget {
  const AnimatedBottomBarItem({super.key, required this.isActive, required this.iconPath, this.onTap});

  final bool isActive;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  State<AnimatedBottomBarItem> createState() => _AnimatedBottomBarItemState();
}

class _AnimatedBottomBarItemState extends State<AnimatedBottomBarItem> with TickerProviderStateMixin {
  static const double iconSize = 22;

  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;
  bool isInitialised = false;
  final ValueNotifier<bool> _isActiveNotifier = ValueNotifier<bool>(false);

  @override
  initState() {
    super.initState();
    _isActiveNotifier.value = widget.isActive;
    _controller = AnimationController(
      duration: 300.ms,
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialised) {
      _colorAnimation = ColorTween(
        begin: Theme.of(context).colorScheme.onBackground,
        end: Theme.of(context).colorScheme.primary,
      ).animate(_controller);
      if (widget.isActive) {
        _controller.value = 1;
      }
      isInitialised = true;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedBottomBarItem oldWidget) {
    if (oldWidget.isActive != widget.isActive) {
      _isActiveNotifier.value = widget.isActive;
      if (widget.isActive) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return SvgIcon(
            widget.iconPath,
            size: iconSize,
            color: _colorAnimation.value!,
          );
        },
      ),
      onPressed: widget.onTap,
    );
  }
}
