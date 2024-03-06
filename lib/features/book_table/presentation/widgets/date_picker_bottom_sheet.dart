import 'package:flutter/material.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({super.key});

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> with SingleTickerProviderStateMixin {
  late final AnimationController _backgroundGlassAnimationController;

  @override
  initState() {
    super.initState();
    _backgroundGlassAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    _backgroundGlassAnimationController.forward();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
