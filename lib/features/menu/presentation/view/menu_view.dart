import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:wing_boat_racing_game/core/utils/asset.dart';
import 'package:wing_boat_racing_game/router/route_names.dart';

class MenuScreen extends HookWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(GameAssets.menuBackground),
            fit: .cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: .min,
            spacing: 100.h,
            children: [
              Image.asset(GameAssets.logoImage),
              GestureDetector(
                onTap: () => context.pushNamed(AppRoute.game.name),
                child: Image.asset(
                  GameAssets.playButton,
                  width: 300,
                  height: 80,
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
