import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/core/styles/colors.dart';
import 'package:dribbble_sushi_bar_challenge/features/bottom_navigation/presentation/views/animated_bottom_bar.dart';
import 'package:dribbble_sushi_bar_challenge/features/cart/presentation/views/cart_view.dart';
import 'package:dribbble_sushi_bar_challenge/features/home/presentation/views/home_view.dart';
import 'package:dribbble_sushi_bar_challenge/features/start/presentation/views/start_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesPaths {
  static const home = '/home';
  static const cart = '/cart';
  static const start = '/';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesPaths.start,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const StartView(),
      ),
    ),
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            extendBody: true,
            body: Container(
                decoration: const BoxDecoration(
                  color: AppColors.scaffoldBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImagePaths.wavesBackground),
                  ),
                ),
                child: child),
            bottomNavigationBar: const AnimatedBottomBar(),
          );
        },
        routes: [
          GoRoute(
            path: RoutesPaths.home,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const HomeView(),
            ),
          ),
          GoRoute(
            path: RoutesPaths.cart,
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const CartView(),
            ),
          ),
        ]),
  ],
);
