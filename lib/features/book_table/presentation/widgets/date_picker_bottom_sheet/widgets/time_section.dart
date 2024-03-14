import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({super.key, required this.bookTableCubit, required this.switchAnimationDuration});

  final Duration switchAnimationDuration;
  final BookTableCubit bookTableCubit;

  Color getColor(bool isPicked, BuildContext context) {
    if (isPicked) {
      return Theme
          .of(context)
          .scaffoldBackgroundColor;
    } else {
      return Theme
          .of(context)
          .colorScheme
          .secondaryContainer;
    }
  }

  TextStyle getTextStyle(bool isPicked, BuildContext context) {
    if (isPicked) {
      return Theme
          .of(context)
          .textTheme
          .titleSmall!;
    } else {
      return Theme
          .of(context)
          .textTheme
          .titleSmall!
          .copyWith(
        color: Theme
            .of(context)
            .colorScheme
            .onSecondaryContainer,
      );
    }
  }

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
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black),
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
                  Color color = getColor(isPicked, context);
                  TextStyle style = getTextStyle(isPicked, context);
                  return GestureDetector(
                    onTap: () => bookTableCubit.pickTime(timeText),
                    child: AnimatedContainer(
                      duration: switchAnimationDuration,
                      margin: Paddings.smallRight,
                      padding: Paddings.mediumHorizontalSmallVertical,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadii.medium,
                      ),
                      child: AnimatedDefaultTextStyle(
                        style: style,
                        duration: switchAnimationDuration,
                        child: Text(timeText),
                      ),
                    ),
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
