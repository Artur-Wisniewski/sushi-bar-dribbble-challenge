import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/helpers/load_image.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/widgets/animated_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    loadImage(context: context, imageUrl: ImagePaths.wavesBackground);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AnimatedAppBar(),
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImagePaths.wavesBackground),
          ),
        ),
        child: const SafeArea(
          child: Stack(
            children: [],
          ),
        ),
      ),
    );
  }
}
