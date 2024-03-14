import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_category_list/category_item.dart';
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

  Duration get categoryItemAnimationDuration => 150.ms;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: Paddings.medium, top: Paddings.medium),
      child: Row(
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          return Padding(
            padding: Paddings.smallRight,
            child: CategoryItem(
              category: category,
              isCategoryPicked: category == pickedCategory,
              onCategoryPicked: onCategoryPicked,
            ),
          );
        })
            .animate(
              interval: categoryItemAnimationDuration,
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
}
