import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DaySection extends StatelessWidget {
  const DaySection({super.key, required this.bookTableCubit});

  final BookTableCubit bookTableCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            L10n.current.day,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
        ),
        const Gap(12),
        BlocBuilder<BookTableCubit, BookTableState>(
          bloc: bookTableCubit,
          buildWhen: (previous, current) => previous.day != current.day,
          builder: (context, state) {
            return SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: List.generate(31, (index) {
                  final day = '${index + 1} ${L10n.current.decemberShort}';
                  bool isPicked = day == state.day;
                  Color color = isPicked
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).colorScheme.secondaryContainer;
                  TextStyle style = isPicked
                      ? Theme.of(context).textTheme.titleSmall!
                      : Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          );
                  return GestureDetector(
                    onTap: () => bookTableCubit.pickDay(day),
                    child: AnimatedContainer(
                      duration: 200.ms,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AnimatedDefaultTextStyle(style: style, duration: 200.ms, child: Text(day)),
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
