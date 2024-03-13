import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_title_english.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/widgets/animated_title_japanese.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.height, required this.englishTitleDelay, required this.japaneseTitleDelay, required this.japaneseLettersInterval, required this.japaneseLetterAnimationDuration});

  final double height;
  final Duration englishTitleDelay;
  final Duration japaneseTitleDelay;
  final Duration japaneseLettersInterval;
  final Duration japaneseLetterAnimationDuration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: height,
          width: 50,
          child: AnimatedTitleEnglish(delay: englishTitleDelay),
        ),
        TitleJapanese(
          height: height,
          delay: japaneseTitleDelay,
          interval: japaneseLettersInterval,
          animationDuration: japaneseLetterAnimationDuration,
        ),
      ],
    );
  }
}
