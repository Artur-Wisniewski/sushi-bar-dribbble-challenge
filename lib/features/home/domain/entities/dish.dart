import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

class DishEntity extends Equatable {
  final String name;
  final double price;
  final bool isNew;
  final String imagePath;
  final CategoryEntity category;

  const DishEntity({
    required this.name,
    required this.price,
    this.isNew = false,
    required this.imagePath,
    required this.category,
  });

  @override
  List<Object?> get props => [name, price, isNew, imagePath, category];
}
