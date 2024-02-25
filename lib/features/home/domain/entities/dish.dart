import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';

class DishEntity {
  final String name;
  final double price;
  final bool isNew;
  final String imagePath;
  final CategoryEntity category;

  DishEntity({
    required this.name,
    required this.price,
    this.isNew = false,
    required this.imagePath,
    required this.category,
  });
}
