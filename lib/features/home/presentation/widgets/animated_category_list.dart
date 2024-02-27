import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCategoryList extends StatelessWidget {
  const AnimatedCategoryList({
    super.key,
    required this.categories,
    required this.categoryListDelayDuration,
    required this.categoryListPlayDuration,
    required this.pickedCategory,
    required this.onCategoryPicked,
  });

  final List<CategoryEntity> categories;

  final Duration categoryListDelayDuration;
  final Duration categoryListPlayDuration;

  final CategoryEntity pickedCategory;

  final Function(CategoryEntity) onCategoryPicked;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: _buildCategory(index, context),
          ),
        )
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
    final category = categories[index];
    bool isCategoryPicked = category == pickedCategory;
    return GestureDetector(
      onTap: () => onCategoryPicked(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: AnimatedDefaultTextStyle(
          style: _categoryTextStyle(context, isCategoryPicked),
          duration: 300.ms,
          child: Text(category.name),
        ),
      ),
    );
  }

  TextStyle _categoryTextStyle(BuildContext context, bool isCategoryPicked) {
    return isCategoryPicked
        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            )
        : Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.3),
              fontWeight: FontWeight.bold,
            );
  }
}
