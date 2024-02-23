import 'package:dribbble_sushi_bar_challenge/core/animations/page_transition.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/views/home_view.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/views/start_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = '/home';
  static const start = '/';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.start:
      return NoAnimationTransition(builder: (context) => const StartView());
    case Routes.home:
      return NoAnimationTransition(builder: (context) => const HomeView());
  }
  throw Exception('Route not found');
}
