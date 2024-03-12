import 'package:dribbble_sushi_bar_challenge/core/widgets/text_swapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({super.key});

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: false,
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      controller: ModalScrollController.of(context),
      physics: const ClampingScrollPhysics(),
      children: [
        const Gap(10),
        Center(
          child: Container(
            width: 50,
            height: 5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        const Gap(20),
        Text('Number of quests', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black)),
        TextSwapper(
          text: '17',
          direction: Axis.horizontal,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
        ),
        const Gap(56),
        Text('Day', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black)),
        // day picker
        const Gap(56),
        Text('Time', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black)),
        // time picker
        const Gap(56),
        CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
