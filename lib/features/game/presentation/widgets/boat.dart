import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:wing_boat_racing_game/core/utils/boat_type.dart';
import 'package:wing_boat_racing_game/features/game/domain/game_state.dart';
import 'package:wing_boat_racing_game/features/game/presentation/controllers/game_provider.dart';

class Boat extends HookConsumerWidget {
  final BoatType type;
  final String boatImage;
  final double position;
  const Boat({
    super.key,
    required this.type,
    required this.boatImage,
    required this.position,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: Duration(milliseconds: 1500),
    );
    final floatingAnimation = useAnimation(
      Tween<double>(begin: -4, end: 4).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOutSine,
        ),
      ),
    );

    useEffect(() {
      animationController.repeat(reverse: true);
      return null;
    }, const []);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      bottom: position + floatingAnimation,
      curve: Curves.easeOutQuad,
      child: GestureDetector(
        child: Container(
          width: 60.h,
          height: 120.h,
          alignment: .center,
          decoration: BoxDecoration(
            //color: Colors.white,
            image: DecorationImage(image: AssetImage(boatImage)),
          ),
          child: Column(
            children: [
              Text(
                type.name.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
