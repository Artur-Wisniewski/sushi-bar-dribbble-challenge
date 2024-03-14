import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/animated_bottom_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/bottom_sheet_handhold.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/day_section.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/number_of_guests_section.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/time_section.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({
    super.key,
    required this.bookTableCubit,
  });

  final BookTableCubit bookTableCubit;

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10), //TODO use paddings
        const BottomSheetHandhold(),
        const Gap(24), //TODO use paddings
        NumberOfGuestsSection(bookTableCubit: widget.bookTableCubit),
        const Gap(24), //TODO use paddings
        DaySection(bookTableCubit: widget.bookTableCubit),
        const Gap(24), //TODO use paddings
        TimeSection(bookTableCubit: widget.bookTableCubit),
        const Gap(24), //TODO use paddings
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: AnimatedBottomButton(
            label: L10n.current.confirm,
            isEnabled: true,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
