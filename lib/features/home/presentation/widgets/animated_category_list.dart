import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCategoryList extends StatelessWidget {
  const AnimatedCategoryList(
      {super.key,
      required this.categories,
      required this.categoryListDelayDuration,
      required this.categoryListPlayDuration});

  final List<CategoryEntity> categories;

  final Duration categoryListDelayDuration;
  final Duration categoryListPlayDuration;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 56, minHeight: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 16, top: 16),
        children: List.generate(
                categories.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _buildCategory(index, context),
                    ))
            .animate(
              interval: 150.ms,
              delay: categoryListDelayDuration,
            )
            .slideY(
              duration: categoryListPlayDuration,
              begin: -0.5,
              end: 0,
              curve: Curves.easeInOutSine,
            )
            .fadeIn(
              duration: categoryListPlayDuration,
            ),
      ),
    );
  }

  Widget _buildCategory(int index, BuildContext context) {
    return Container(
      height:30,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        categories[index].name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
