import 'package:dribbble_sushi_bar_challenge/core/constants/rive_animations_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/models/rive_animations/table_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hexagon/hexagon.dart';
import 'package:rive/rive.dart';

class ReservableTablesGrid extends StatefulWidget {
  const ReservableTablesGrid({super.key, required this.pickedTableNotifier});

  final ValueNotifier<(int, int)?> pickedTableNotifier;

  @override
  State<ReservableTablesGrid> createState() => _ReservableTablesGridState();
}

class _ReservableTablesGridState extends State<ReservableTablesGrid> {
  int get _numberOfColumns => 3;

  int get _numberOfRows => 4;

  final Map<(int, int), StateMachineController> tablesAnimationsControllers = {};

  void _onInit(
    Artboard art,
    int row,
    int col,
    bool isEnabled,
  ) {
    var ctrl = StateMachineController.fromArtboard(art, 'idle') as StateMachineController;
    ctrl.isActive = true;

    final isFreeInput = ctrl.findInput<bool>('isFree') as SMIBool;
    final showInput = ctrl.findInput<bool>('appear') as SMITrigger;
    isFreeInput.value = isEnabled;
    Future.delayed(200.ms + 80.ms * getIndexByRowAndCol(row, col), () => showInput.fire());
    art.addController(ctrl);
    setState(() {
      tablesAnimationsControllers.addAll({(row, col): ctrl});
    });
  }

  bool isEnabled(int row) => row % 2 == 0;

  int getIndexByRowAndCol(int row, int col) => row + (col * _numberOfRows).clamp(1, double.infinity).toInt();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HexagonOffsetGrid.evenFlat(
            columns: _numberOfColumns,
            rows: _numberOfRows,
            padding: const EdgeInsets.all(8),
            buildTile: (col, row) => HexagonWidgetBuilder.transparent(
              padding: 6,
              cornerRadius: 0,
            ),
            buildChild: (col, row) {
              if (row == _numberOfRows - 1 && col != _numberOfColumns - 2) return const SizedBox();
              return GestureDetector(
                onTap: () {
                  final controller = tablesAnimationsControllers[(row, col)];
                  final toggle = controller?.findInput<bool>('toggle') as SMITrigger;
                  if (row % 2 == 0 && widget.pickedTableNotifier.value == null || widget.pickedTableNotifier.value == (row, col)) {
                    toggle.fire();
                    setState(() => widget.pickedTableNotifier.value = widget.pickedTableNotifier.value == (row, col) ? null : (row, col));
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RiveAnimation.asset(
                      artboard: TableAnimation.artBoardName,
                      RiveAnimationsPaths.japaneseRestaurantAnimations,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      onInit: (art) => _onInit(art, row, col, isEnabled(row)),
                    ),
                    AnimatedDefaultTextStyle(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: isEnabled(row) && widget.pickedTableNotifier.value != (row, col) ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      duration: 150.ms,
                      child: Text(
                        '${getIndexByRowAndCol(row, col)}',
                      ),
                    )
                        .animate(
                          delay: 300.ms + 80.ms * getIndexByRowAndCol(row, col),
                        )
                        .fadeIn(
                          duration: 150.ms,
                        )
                        .rotate(
                          duration: 150.ms,
                          begin: -0.1,
                          end: 0,
                        )
                        .scale(begin: const Offset(0.8, 0.8), end: const Offset(0.8, 0.8), duration: 150.ms)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
