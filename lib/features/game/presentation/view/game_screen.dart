import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:wing_boat_racing_game/core/utils/asset.dart';
import 'package:wing_boat_racing_game/core/utils/boat_type.dart';
import 'package:wing_boat_racing_game/features/game/game.dart';
import 'package:wing_boat_racing_game/features/game/presentation/controllers/game_provider.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);
    final timeCountDown = useState(4);

    final boatImages = [
      'assets/images/player_boat.png',
      'assets/images/ai_boat_1.png',
      'assets/images/ai_boat_2.png',
    ];

    final notifier = ref.read(gameProvider.notifier);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (timeCountDown.value > 0) {
          timeCountDown.value -= 1;
        } else {
          t.cancel();
          notifier.startGame(); // start only after countdown ends
        }
      });
      return timer.cancel;
    }, []);

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

                    color: Colors.black.withOpacity(0.1),
                    child: Stack(
                      alignment: .bottomCenter,
                      children: [
                        // finish line
                        Positioned(
                          bottom:
                              ref.watch(
                                gameProvider.select((s) => s.winDistance),
                              ) +
                              140,
                          child: Container(
                            width: 100.w,
                            height: 8,
                            color: Colors.red,
                          ),
                        ),

                        // boat
                        Boat(
                          type: i == 0 ? BoatType.player : BoatType.ai,
                          boatImage: boatImages[i],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            if (timeCountDown.value > 0)
              Center(
                child: Text(
                  timeCountDown.value == 1
                      ? 'Start'
                      : (timeCountDown.value - 1).toString(),
                  style: TextStyle(
                    fontSize: 100.h,
                    color: Colors.white,
                    fontWeight: .bold,
                  ),
                ),
              ),
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () async {
                  if (isPressed.value == false) {
                    isPressed.value = true;
                    notifier.move();
                    await Future.delayed(Duration(milliseconds: 100));
                    isPressed.value = false;
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),

                  height: isPressed.value ? 110.h : 100.h,
                  width: isPressed.value ? 110.h : 100.h,
                  padding: EdgeInsets.all(20.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 8.h,
                      color: Colors.yellow.shade100,
                    ),
                    color: Colors.deepOrange,
                    shape: .circle,
                    gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.orangeAccent],
                    ),
                    image: DecorationImage(
                      fit: .contain,
                      image: AssetImage(GameAssets.pandleIcon),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
