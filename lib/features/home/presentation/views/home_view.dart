import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/helpers/load_image.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/data/dishes_data_source.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_app_bar.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_bottom_bar.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/dish_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final dishes = DishesDataSource.getDishes();
  final scrollController = ScrollController();

  @override
  void initState() {
    loadImage(context: context, imageUrl: ImagePaths.wavesBackground);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AnimatedBottomBar(),
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImagePaths.wavesBackground),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: AnimatedAppBar(),
              ),
              const Gap(30),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(dishes.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: DishCard(
                          dish: dishes[index],
                          scrollController: scrollController,
                        ),
                      );
                    })
                        .animate(
                          delay: 1500.ms,
                          interval: 250.ms,
                        )
                        .fadeIn(duration: 700.ms)
                        .slideX(
                          begin: 0.05,
                          end: 0,
                          duration: 700.ms,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
