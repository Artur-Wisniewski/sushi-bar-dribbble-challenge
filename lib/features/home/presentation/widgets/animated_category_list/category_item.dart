import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.isCategoryPicked, required this.onCategoryPicked});

  final CategoryEntity category;
  final bool isCategoryPicked;
  final Function(CategoryEntity) onCategoryPicked;

  Duration get categoryTextAnimationDuration => 300.ms;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCategoryPicked(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: AnimatedDefaultTextStyle(
          style: _getCategoryTextStyle(context, isCategoryPicked),
          duration: categoryTextAnimationDuration,
          child: Text(category.name),
        ),
      ),
    );
  }

  TextStyle _getCategoryTextStyle(BuildContext context, bool isCategoryPicked) {
    return isCategoryPicked
        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            )
        : Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            );
  }
}