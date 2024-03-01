import 'package:dribbble_sushi_bar_challenge/core/widgets/text_swapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CountPicker extends StatefulWidget {
  const CountPicker({
    super.key,
    required this.price,
    required this.onAdd,
    required this.onRemove,
    required this.counter,
    this.buttonScale = 1.0,
    this.heightScale = 1.0,
    this.isCompact = false,
  });

  const CountPicker.small({
    super.key,
    required this.price,
    required this.onAdd,
    required this.onRemove,
    required this.counter,
  })  : buttonScale = 0.7,
        heightScale = 0.86,
        isCompact = true;

  final double price;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final int counter;
  final double buttonScale;
  final double heightScale;
  final bool isCompact;

  @override
  State<CountPicker> createState() => _CountPickerState();
}

class _CountPickerState extends State<CountPicker> with TickerProviderStateMixin {
  late final AnimationController scaleController = AnimationController(vsync: this);

  bool get isCounterVisible => counter.value > 0;

  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  Color get backgroundColor =>
      isCounterVisible ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).colorScheme.secondary;

  final GlobalKey key = GlobalKey();

  Duration get scaleDuration => 150.ms;

  Duration get scaleDownDelay => scaleDuration;

  Offset get scaleDownSizeEndOffset => const Offset(0.95, 0.95);

  Offset get scaleBeginOffset => const Offset(1, 1);

  Offset get scaleUpSizeEndOffset => const Offset(1.1, 1.1);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) scaleController.reset();
    });
    counter.value = widget.counter;
  }

  @override
  void didUpdateWidget(covariant CountPicker oldWidget) {
    if (oldWidget.counter != widget.counter) counter.value = widget.counter;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (counter.value == 0) {
          widget.onAdd();
          scaleController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: counter,
        builder: (context, _) {
          return AnimatedContainer(
            height: widget.heightScale * 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            duration: 300.ms,
            child: Row(
              mainAxisSize: widget.isCompact ? MainAxisSize.min: MainAxisSize.max,
              mainAxisAlignment: counter.value > 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                if (isCounterVisible)
                  _buildButton(
                    onPressed: () {
                      widget.onRemove();
                    },
                    icon: Icons.remove_rounded,
                  )
                      .animate()
                      .slideX(
                        delay: scaleDownDelay,
                        duration: scaleDuration,
                        begin: 0.2,
                        end: 0.0,
                      )
                      .fadeIn(
                        delay: scaleDownDelay,
                        duration: scaleDuration,
                      ),
                TextSwapper(
                  key: key,
                  text: counter.value > 0 ? counter.value.toString() : '\$${widget.price.toStringAsFixed(0)}',
                  durationOut: 150.ms,
                  durationIn: 150.ms,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: isCounterVisible ? Theme.of(context).colorScheme.secondary : Theme.of(context).hintColor,
                      ),
                ),
                if (isCounterVisible)
                  _buildButton(
                    onPressed: () {
                      widget.onAdd();
                    },
                    icon: Icons.add_rounded,
                  )
                      .animate()
                      .slideX(
                        delay: scaleDownDelay,
                        duration: scaleDuration,
                        begin: -0.2,
                        end: 0.0,
                      )
                      .fadeIn(
                        delay: scaleDownDelay,
                        duration: scaleDuration,
                      ),
              ],
            ),
          )
              .animate(
                autoPlay: false,
                controller: scaleController,
              )
              .scale(
                duration: scaleDuration,
                begin: scaleBeginOffset,
                end: scaleDownSizeEndOffset,
              )
              .then(delay: scaleDownDelay)
              .scale(
                duration: scaleDuration,
                begin: scaleBeginOffset,
                end: scaleUpSizeEndOffset,
              );
        },
      ),
    );
  }

  Widget _buildButton({required VoidCallback onPressed, required IconData icon}) {
    return IconButton(
      padding: const EdgeInsets.all(0.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      onPressed: onPressed,
      iconSize: 28 * widget.buttonScale,
      visualDensity: widget.buttonScale < 1.0 ? VisualDensity.compact : VisualDensity.standard,
      icon: Container(
        height: 30 * widget.buttonScale,
        width: 30 * widget.buttonScale,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon),
      ),
    );
  }
}
