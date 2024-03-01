import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/widgets/serve_option_switcher.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Gap(16),
            ServeOptionSwitcher(),
          ],
        ),
      ),
    );
  }
}
