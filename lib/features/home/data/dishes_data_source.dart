import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';

class DishesDataSource {
  static List<DishEntity> getDishes() {
    return [
      DishEntity(
        name: 'Spicy Gyoza with Garlic',
        price: 15.0,
        isNew: true,
        imagePath: ImagePaths.gyoza,
      ),
      DishEntity(
        name: 'Salmon Poke Bowl with Avocado',
        price: 20.0,
        imagePath: ImagePaths.pokeBowl,
      ),
      DishEntity(
        name: 'Classic Ramen Soup with Chicken',
        price: 18.0,
        imagePath: ImagePaths.ramenSoup,
      ),
      DishEntity(
        name: 'Pink Ramen with Shrimp',
        price: 22.0,
        imagePath: ImagePaths.ramenPink,
      ),
      DishEntity(
        name: 'Ramen with Chicken',
        price: 20.0,
        imagePath: ImagePaths.ramen,
      ),
      DishEntity(
        name: 'Sushi Rice with Salmon',
        price: 25.0,
        imagePath: ImagePaths.sushiRiceSalmon,
      ),
      DishEntity(
        name: 'Sushi Rolls with Rice',
        price: 22.0,
        imagePath: ImagePaths.sushiRolls,
      ),
      DishEntity(
        name: 'Salmon Sushi with Rice',
        price: 12.0,
        imagePath: ImagePaths.sushiSalmon,
      ),
      DishEntity(
        name: 'Crab Sticks with Rice',
        price: 10.0,
        imagePath: ImagePaths.crabSticks,
      ),
      DishEntity(
        name: 'Vegetable Soup',
        price: 15.0,
        imagePath: ImagePaths.vegetableSoup,
      ),
    ];
  }
}