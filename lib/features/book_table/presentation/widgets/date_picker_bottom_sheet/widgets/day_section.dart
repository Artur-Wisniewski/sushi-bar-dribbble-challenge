import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/animated_tile.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaySection extends StatelessWidget {
  const DaySection({super.key, required this.bookTableCubit, required this.switchAnimationDuration});

  final Duration switchAnimationDuration;

  final BookTableCubit bookTableCubit;

  String getDayByIndex(int index) {
    return '${index + 1} ${L10n.current.decemberShort}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: Paddings.mediumHorizontal,
          child: Text(
            L10n.current.day,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
        ),
        Gaps.medium,
        BlocBuilder<BookTableCubit, BookTableState>(
          bloc: bookTableCubit,
          buildWhen: (previous, current) => previous.day != current.day,
          builder: (context, state) {
            return SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: Paddings.mediumHorizontal,
                children: List.generate(31, (index) {
                  final day = getDayByIndex(index);
                  bool isPicked = day == state.day;
                  return AnimatedTile(
                    animationDuration: switchAnimationDuration,
                    isPicked: isPicked,
                    onTap: () => bookTableCubit.pickDay(day),
                    text: day,
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}
