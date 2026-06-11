import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wing_boat_racing_game/features/game/game.dart';
import 'package:wing_boat_racing_game/features/layouts/main_layout.dart';
import 'package:wing_boat_racing_game/features/menu/presentation/view/menu_view.dart';
import 'package:wing_boat_racing_game/features/profile/presentation/view/profile_view.dart';
import 'package:wing_boat_racing_game/features/trophy/presentation/view/trophy_view.dart';

import 'router.dart';

final navigationKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigationKey,
  initialLocation: AppRoute.main.path,
  routes: [
    GoRoute(
      path: AppRoute.main.path,
      name: AppRoute.main.name,
      builder: (context, state) => MainLayout(),
    ),
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
    GoRoute(
      path: AppRoute.trophy.path,
      name: AppRoute.trophy.name,
      builder: (context, state) {
        return TrophyScreen();
      },
    ),
    GoRoute(
      path: AppRoute.profile.path,
      name: AppRoute.profile.name,
      builder: (context, state) {
        return ProfileScreen();
      },
    ),
  ],
);
