import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_title_english.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_title_japanese.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: height,
          width: 50,
          child: AnimatedTitleEnglish(delay: 500.ms),
        ),
        TitleJapanese(
          height: height,
          delay: 1000.ms,
        ),
      ],
    );
  }
}
