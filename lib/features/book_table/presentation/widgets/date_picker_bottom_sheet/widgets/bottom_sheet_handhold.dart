import 'package:flutter/material.dart';

class BottomSheetHandhold extends StatelessWidget {
  const BottomSheetHandhold({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
