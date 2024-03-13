import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextSwapper extends StatefulWidget {
  const TextSwapper({
    super.key,
    required this.text,
    this.style,
    this.durationOut = const Duration(milliseconds: 250),
    this.durationIn = const Duration(milliseconds: 250),
    this.direction = Axis.vertical,
  });

  final String text;
  final Axis direction;
  final TextStyle? style;
  final Duration durationOut;
  final Duration durationIn;

  @override
  State<TextSwapper> createState() => _TextSwapperState();
}

class _TextSwapperState extends State<TextSwapper> with TickerProviderStateMixin {
  late String currentText;
  late TextStyle currentStyle;

  late final AnimationController _controller = AnimationController(vsync: this, duration: 300.ms);
  late final AnimationController _controller2 = AnimationController(vsync: this, duration: 300.ms);

  late final Offset slideEndPosition = const Offset(0, 0);

  Offset get slidePosition => widget.direction == Axis.vertical ? const Offset(0, -0.65) : const Offset(-0.65, 0);

  Offset get slideOppositePosition => widget.direction == Axis.vertical ? const Offset(0, 0.65) : const Offset(0.65, 0);

  @override
  void initState() {
    super.initState();
    currentText = widget.text;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currentText = widget.text;
        });
      }
    });
    _controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.reset();
        _controller.reset();
      }
    });
  }

  @override
  void didChangeDependencies() {
    currentStyle =
        widget.style ?? Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant TextSwapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _controller.forward();
      _controller2.forward();
    }
    if (widget.style != oldWidget.style) {
      setState(() {
        currentStyle = widget.style ??
            Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          currentText,
          style: currentStyle,
        )
            .animate(
              controller: _controller2,
              autoPlay: false,
            )
            .then(
              delay: widget.durationOut,
            )
            .slide(
              duration: widget.durationOut,
              begin: slidePosition,
              end: slideEndPosition,
            )
            .fadeIn(
              duration: widget.durationIn,
            ),
        Text(
          currentText,
          style: widget.style ??
              Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
        )
            .animate(
              controller: _controller,
              autoPlay: false,
            )
            .slide(
              duration: widget.durationOut,
              begin: slideEndPosition,
              end: slideOppositePosition,
            )
            .fadeOut(
              duration: widget.durationOut,
            ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
