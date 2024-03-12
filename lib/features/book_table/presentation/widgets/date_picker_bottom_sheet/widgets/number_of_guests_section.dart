import 'package:dribbble_sushi_bar_challenge/core/widgets/round_button.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/text_swapper.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NumberOfGuestsSection extends StatelessWidget {
  const NumberOfGuestsSection({super.key, required this.bookTableCubit});

  final BookTableCubit bookTableCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Number of quests', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black)),
          const Gap(20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundIconButton.secondary(
                  icon: CupertinoIcons.minus,
                  onPressed: bookTableCubit.decrementNumberOfGuests,
                ),
                const Gap(15),
                BlocBuilder<BookTableCubit, BookTableState>(
                  bloc: bookTableCubit,
                  buildWhen: (previous, current) => previous.numberOfGuests != current.numberOfGuests,
                  builder: (context, state) {
                    return TextSwapper(
                      text: state.numberOfGuests.toString(),
                      direction: Axis.horizontal,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),
                    );
                  },
                ),
                const Gap(15),
                RoundIconButton.secondary(
                  icon: CupertinoIcons.plus,
                  onPressed: bookTableCubit.incrementNumberOfGuests,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
