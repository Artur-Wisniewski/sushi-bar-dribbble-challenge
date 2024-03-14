import 'package:dribbble_sushi_bar_challenge/core/constants/gaps.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/manager/book_table_cubit.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/animated_bottom_button.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/bottom_sheet_handhold.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/day_section.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/number_of_guests_section.dart';
import 'package:dribbble_sushi_bar_challenge/features/book_table/presentation/widgets/date_picker_bottom_sheet/widgets/time_section.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({
    super.key,
    required this.bookTableCubit,
  });

  final BookTableCubit bookTableCubit;

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  Duration get switchAnimationDuration => 200.ms;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.small,
        const BottomSheetHandhold(),
        Gaps.medium,
        NumberOfGuestsSection(bookTableCubit: widget.bookTableCubit),
        Gaps.medium,
        DaySection(
          bookTableCubit: widget.bookTableCubit,
          switchAnimationDuration: switchAnimationDuration,
        ),
        Gaps.medium,
        TimeSection(
          bookTableCubit: widget.bookTableCubit,
          switchAnimationDuration: switchAnimationDuration,
        ),
        Gaps.medium,
        Padding(
          padding: Paddings.mediumAllBottomBig,
          child: AnimatedBottomButton(
            label: L10n.current.confirm,
            isEnabled: true,
            onPressed: () {},
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
