import 'package:dribbble_sushi_bar_challenge/core/constants/border_radiuses.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/paddings.dart';
import 'package:dribbble_sushi_bar_challenge/core/constants/sizes.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/core/widgets/springy_button.dart';
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
      bottomNavigationBar: Padding(
        padding: Paddings.mediumBottom,
        child: SpringyButton(
          child: Container(
            alignment: Alignment.center,
            height: Sizes.bottomBarHeight,
            padding: Paddings.mediumAll,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadii.circular,
            ),
            child: Text('Reserve'),
          ),
          onPressed: () {
            // _titleController.forward();
            // _noodlesController.forward();
            // Future.delayed(400.ms, () => context.go(RoutesPaths.home));
          },
        ),
      ),
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
