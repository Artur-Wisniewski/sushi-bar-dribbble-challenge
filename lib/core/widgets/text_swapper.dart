import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TextSwapper extends StatefulWidget {
  const TextSwapper({
    super.key,
    required this.text,
    this.style,
    required this.durationOut,
    required this.durationIn,
  });

  final String text;
  final TextStyle? style;
  final Duration durationOut;
  final Duration durationIn;

  @override
  State<TextSwapper> createState() => _TextSwapperState();
}

class _TextSwapperState extends State<TextSwapper> with TickerProviderStateMixin {
  late String currentText;
  late TextStyle currentStyle;

  late final _controller = AnimationController(vsync: this, duration: 300.ms);
  late final _controller2 = AnimationController(vsync: this, duration: 300.ms);

  @override
  void initState() {
    super.initState();
    currentText = widget.text;
    currentStyle = widget.style ??
        Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            );
    _controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller2.reset();
        _controller.reset();
      }
    });
  }

  @override
  void didUpdateWidget(covariant TextSwapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _controller.forward();
      _controller2.forward();
      //TODO this time is a workaround
      Future.delayed(140.ms, () {
        setState(() {
          currentText = widget.text;
        });
      });
    }
    if (widget.style != oldWidget.style) {
      setState(() {
        currentStyle = widget.style ??
            Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                );
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
            .slideY(
              duration: widget.durationOut,
              begin: -0.65,
              end: 0.0,
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
            .slideY(
              duration: widget.durationOut,
              begin: 0.0,
              end: 0.65,
            )
            .fadeOut(
              duration: widget.durationOut,
            ),
      ],
    );
  }
}
