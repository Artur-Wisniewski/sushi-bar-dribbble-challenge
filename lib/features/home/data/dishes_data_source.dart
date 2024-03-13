import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/category.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/domain/entities/dish.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';

class DishesDataSource {
  static List<DishEntity> getDishes() {
    return [
      DishEntity(
        name: L10n.current.spicyGyozaWithGarlic,
        price: 15.0,
        isNew: true,
        imagePath: ImagePaths.gyoza,
        category: const CategoryEntity('Gyoza'),
      ),
      DishEntity(
        name: L10n.current.salmonPokeBowlAvocado,
        price: 20.0,
        imagePath: ImagePaths.pokeBowl,
        category: const CategoryEntity('Poke Bowl'),
      ),
      DishEntity(
        name: L10n.current.classicRamenSoupChicken,
        price: 18.0,
        imagePath: ImagePaths.ramenSoup,
        category: const CategoryEntity('Ramen'),
      ),
      DishEntity(
        name: L10n.current.pinkRamenShrimp,
        price: 22.0,
        imagePath: ImagePaths.ramenPink,
        category: const CategoryEntity('Ramen'),
      ),
      DishEntity(
        name: L10n.current.ramenWithChicken,
        price: 20.0,
        imagePath: ImagePaths.ramen,
        category: const CategoryEntity('Ramen'),
      ),
      DishEntity(
        name: L10n.current.sushiRiceSalmon,
        price: 25.0,
        imagePath: ImagePaths.sushiRiceSalmon,
        category: const CategoryEntity('Sushi'),
      ),
      DishEntity(
        name: L10n.current.sushiRolls,
        price: 22.0,
        imagePath: ImagePaths.sushiRolls,
        category: const CategoryEntity('Sushi Rolls'),
      ),
      DishEntity(
        name: L10n.current.salmonSushiRice,
        price: 12.0,
        imagePath: ImagePaths.sushiSalmon,
        category: const CategoryEntity('Sushi'),
      ),
      DishEntity(
        name: L10n.current.crabSticksWithRice,
        price: 10.0,
        imagePath: ImagePaths.crabSticks,
        category: const CategoryEntity('Crab'),
      ),
      DishEntity(
        name: L10n.current.vegetableSoup,
        price: 15.0,
        imagePath: ImagePaths.vegetableSoup,
        category: const CategoryEntity('Soup'),
      ),
    ];
  }
}
