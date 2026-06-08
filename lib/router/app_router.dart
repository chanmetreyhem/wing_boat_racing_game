import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wing_boat_racing_game/features/game/game.dart';
import 'package:wing_boat_racing_game/features/menu/presentation/view/menu_view.dart';

import 'router.dart';

final navigationKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRoute.menu.path,
  routes: [
    GoRoute(
      path: AppRoute.game.path,
      name: AppRoute.game.name,
      builder: (context, state) => GameScreen(),
    ),
    GoRoute(
      path: AppRoute.menu.path,
      name: AppRoute.menu.name,
      builder: (context, state) {
        return MenuScreen();
      },
    ),
  ],
);
