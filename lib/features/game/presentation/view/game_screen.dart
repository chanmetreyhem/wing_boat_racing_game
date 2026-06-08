
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:wing_boat_racing_game/features/game/game.dart';

class GameScreen extends HookWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double winDistance = 570.0;
    final boatImages = [
      'assets/images/player_boat.png',
      'assets/images/ai_boat_1.png',
      'assets/images/ai_boat_2.png',
    ];

    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/phnom_penh_river.png',
                fit: BoxFit.cover,

                colorBlendMode: BlendMode.hardLight,
              ),
            ),
            // river path
            Row(
              mainAxisAlignment: .center,

              spacing: 30.w,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    width: 40.w,
                    color: Colors.black.withOpacity(0.8),

                    child: Stack(
                      alignment: .bottomCenter,
                      children: [
                        // finish line
                        Positioned(
                          bottom: winDistance + 140,
                          child: Container(
                            width: 100.w,
                            height: 8,
                            color: Colors.red,
                          ),
                        ),

                        // boat
                        Boat(boatImage: boatImages[i]),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
