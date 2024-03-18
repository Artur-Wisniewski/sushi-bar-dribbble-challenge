import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/animated_tile.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({super.key, required this.bookTableCubit, required this.switchAnimationDuration});

  final Duration switchAnimationDuration;
  final BookTableCubit bookTableCubit;

  String getFormattedTime(DateTime time) {
    return '${time.hour <= 12 ? time.hour : '0${time.hour - 12}'}${time.minute != 0 ? ':${time.minute}' : ''} PM';
  }

  DateTime getTimeByIndex(int index) {
    return DateTime(0, 0, 0, 12).add(const Duration(minutes: 30) * index);
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
              L10n.current.time,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
            )),
        Gaps.medium,
        BlocBuilder<BookTableCubit, BookTableState>(
          bloc: bookTableCubit,
          buildWhen: (previous, current) => previous.time != current.time,
          builder: (context, state) {
            return SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: Paddings.mediumHorizontal,
                children: List.generate(20, (index) {
                  final time = getTimeByIndex(index);
                  final timeText = getFormattedTime(time);
                  bool isPicked = timeText == state.time;
                  return AnimatedTile(
                    animationDuration: switchAnimationDuration,
                    isPicked: isPicked,
                    onTap: () => bookTableCubit.pickTime(timeText),
                    text: timeText,
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
