import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/animated_bottom_button.dart';
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

class _BookTableViewState extends State<BookTableView> {
  final ValueNotifier<(int, int)?> pickedTableNotifier = ValueNotifier(null);

  void onPopInvoked() {
    context.read<BottomBarNavigationCubit>().markNavigateOutsideShell(false);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        onPopInvoked();
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AnimatedAppBar(onLeadingButton: onPopInvoked),
        bottomNavigationBar: Padding(
          padding: Paddings.mediumBottom,
          child: AnimatedBuilder(
              animation: pickedTableNotifier,
              builder: (context, child) {
                return AnimatedBottomButton(
                  label: 'Reserve',
                  onPressed: pickedTableNotifier.value != null ? () {
                    //TODO show bottom modal
                  } : null,
                );
              }),
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
                ReservedTablesLegend(animationDelay: 500.ms)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
