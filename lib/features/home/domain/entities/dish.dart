class DishEntity {
  final String name;
  final double price;
  final bool isNew;
  final String imagePath;

  DishEntity({
    required this.name,
    required this.price,
    this.isNew = false,
    required this.imagePath,
  });
}
