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
    return Material(
      child: SafeArea(
        bottom: false,
        child: ListView(
          reverse: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          controller: ModalScrollController.of(context),
          physics: const ClampingScrollPhysics(),
          children: [
            Text('Number of quests', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black)),
            // number picker
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
        ),
      ),
    );
  }
}
