import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:wing_boat_racing_game/core/theme/app_theme_extensions.dart';
import 'package:wing_boat_racing_game/core/utils/asset.dart';
import 'package:wing_boat_racing_game/router/router.dart';

class MenuScreen extends HookConsumerWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10.h,
          children: [
            Image.asset(GameAssets.medalIcon, height: 40.h, width: 40.h),
            Text(
              '100',
              style: context.textTheme.titleLarge!.copyWith(fontWeight: .bold),
            ),
          ],
        ),
        actions: [
          Image.asset(GameAssets.dragonBoat, height: 120.h, width: 120.h),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 20.h,
          children: <Widget>[
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('Welcome back', style: context.textTheme.bodyLarge),

                Text(
                  'Gumiho',
                  style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
            Container(
              height: 420.h,
              //  padding: .all(20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    //offset: Offset(10, 1),
                    blurRadius: 0.1,
                    spreadRadius: 0.1,
                    blurStyle: .solid,
                  ),
                ],
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(GameAssets.boxBg),
                  colorFilter: ColorFilter.mode(
                    Colors.black,
                    BlendMode.colorDodge,
                  ),
                  fit: .cover,
                ),
                borderRadius: BorderRadius.circular(35.h),
              ),
              child: Container(
                padding: .all(20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.h),
                  gradient: LinearGradient(
                    begin: .topCenter,
                    end: .bottomLeft,
                    stops: [0, 0.2, 0.7],
                    colors: [Colors.black12, Colors.transparent, Colors.black],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: .end,
                  crossAxisAlignment: .start,
                  children: <Widget>[
                    Text(
                      "Dragon Boat",
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      'Khmer Festival Festival Mini-Games Collection',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: .bold,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoute.game.name);
                      },
                      child: Container(
                        alignment: .center,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: .circular(20.h),
                          gradient: LinearGradient(
                            begin: .topCenter,
                            end: .bottomCenter,
                            stops: [0.5, 1],
                            colors: [Colors.deepPurple, Colors.white70],
                          ),
                        ),
                        child: Row(
                          spacing: 10.h,
                          mainAxisAlignment: .center,
                          children: [
                            Icon(CupertinoIcons.play_fill, color: Colors.white),
                            Text(
                              "LET'S PLAY",
                              style: context.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: .bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
