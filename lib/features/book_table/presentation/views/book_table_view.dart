import 'dart:ui';

import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/animated_bottom_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/date_picker_bottom_sheet.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/reservable_tables_grid.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/reserved_tables_legend.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/manager/bottom_bar_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/animated_app_bar.dart';

class BookTableView extends StatefulWidget {
  const BookTableView({super.key});

  @override
  State<BookTableView> createState() => _BookTableViewState();
}

class _BookTableViewState extends State<BookTableView> with SingleTickerProviderStateMixin {
  final ValueNotifier<(int, int)?> pickedTableNotifier = ValueNotifier(null);
  late final AnimationController _blurAnimationController = AnimationController(
    duration: blurAnimationDuration,
    vsync: this,
  );

  Duration get blurAnimationDuration => 500.ms;

  Duration get reservedTablesLegendAnimationDuration => 500.ms;

  Duration get animatedAppBarDuration => 500.ms;

  final BookTableCubit bookTableCubit = BookTableCubit();

  void onPopInvoked() {
    context.read<BottomBarNavigationCubit>().markNavigateOutsideShell(false);
    context.pop();
  }

  void onReserve() {
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.transparent,
      secondAnimation: _blurAnimationController,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radii.medium,
          topRight: Radii.medium,
        ),
      ),
      builder: (context) => DatePickerBottomSheet(bookTableCubit: bookTableCubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            onPopInvoked();
          },
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AnimatedAppBar(
              onLeadingButton: onPopInvoked,
              animationDuration: animatedAppBarDuration,
            ),
            bottomNavigationBar: Padding(
              padding: Paddings.mediumAllBottomBig,
              child: AnimatedBuilder(
                animation: pickedTableNotifier,
                builder: (context, child) => AnimatedBottomButton(
                  label: L10n.current.reserve,
                  isEnabled: pickedTableNotifier.value != null,
                  onPressed: onReserve,
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: AppColors.scaffoldBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImagePaths.wavesBackground),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ReservableTablesGrid(pickedTableNotifier: pickedTableNotifier),
                    ),
                    ReservedTablesLegend(animationDelay: reservedTablesLegendAnimationDuration)
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: SizedBox.expand(
            child: AnimatedBuilder(
              builder: (context, _) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: _blurAnimationController.value * 2, sigmaY: _blurAnimationController.value * 2),
                  child: Container(),
                );
              },
              animation: _blurAnimationController,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _blurAnimationController.dispose();
    bookTableCubit.close();
    super.dispose();
  }
}
