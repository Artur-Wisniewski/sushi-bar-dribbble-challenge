import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/animated_app_bar.dart';

class BookTableView extends StatefulWidget {
  const BookTableView({super.key});

  @override
  State<BookTableView> createState() => _BookTableViewState();
}

class _BookTableViewState extends State<BookTableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const AnimatedAppBar(),
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Book Table',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
