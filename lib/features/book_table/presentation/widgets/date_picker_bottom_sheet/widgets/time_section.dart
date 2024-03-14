import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({super.key, required this.bookTableCubit});

  final BookTableCubit bookTableCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), //TODO use paddings
            child: Text(
              L10n.current.time,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
            )),
        const Gap(12), //TODO use paddings
        BlocBuilder<BookTableCubit, BookTableState>(
          bloc: bookTableCubit,
          buildWhen: (previous, current) => previous.time != current.time,
          builder: (context, state) {
            return SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20), //TODO use paddings
                children: List.generate(20, (index) {
                  final time = DateTime(0, 0, 0, 12).add(const Duration(minutes: 30) * index);
                  final timeText =
                      '${time.hour <= 12 ? time.hour : '0${time.hour - 12}'}${time.minute != 0 ? ':${time.minute}' : ''} PM';
                  bool isPicked = timeText == state.time;
                  Color color = isPicked
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).colorScheme.secondaryContainer;
                  TextStyle style = isPicked
                      ? Theme.of(context).textTheme.titleSmall!
                      : Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          );
                  return GestureDetector(
                    onTap: () => bookTableCubit.pickTime(timeText),
                    child: AnimatedContainer(
                      duration: 200.ms,
                      margin: const EdgeInsets.only(right: 10), //TODO use paddings
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10), //TODO use paddings
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20), //TODO use paddings
                      ),
                      child: AnimatedDefaultTextStyle(style: style, duration: 200.ms, child: Text(timeText)),
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
