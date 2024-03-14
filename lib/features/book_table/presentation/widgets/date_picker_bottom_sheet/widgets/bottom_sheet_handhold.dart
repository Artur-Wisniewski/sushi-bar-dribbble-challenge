import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
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
        decoration: const BoxDecoration(
          color: AppColors.greyLight2,
          borderRadius: BorderRadii.circular,
        ),
      ),
    );
  }
}
