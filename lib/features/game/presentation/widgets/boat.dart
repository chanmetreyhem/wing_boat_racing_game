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
  const Boat({super.key, required this.type, required this.boatImage});

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
    final game = ref.watch(gameProvider);
    final notifier = ref.read(gameProvider.notifier);

    late double speed = 20;
    final startPosition = 40.w;

    final position = useState<double>(startPosition);

    useEffect(() {
      animationController.repeat(reverse: true);

      return null;
    }, const []);

    useEffect(() {
      if (type == BoatType.player) return null;

      final timer = Timer.periodic(Duration(milliseconds: 300), (t) {
        if (game.status == GameStatus.start) {
          Random random = Random();
          double randSpeed = 20 + random.nextDouble() * (40 - 20);
          position.value += randSpeed;
          Future.microtask(() {
            notifier.checkWin(position.value);
          });
        }
      });
      return timer.cancel;
    }, [game.status]);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      bottom: type == BoatType.ai
          ? position.value
          : game.position + floatingAnimation,
      curve: Curves.easeOutQuad,
      child: GestureDetector(
        child: Container(
          width: 40.w,
          height: 80.h,
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
