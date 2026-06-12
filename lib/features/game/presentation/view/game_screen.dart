import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:wing_boat_racing_game/core/theme/app_color.dart';
import 'package:wing_boat_racing_game/core/utils/asset.dart';
import 'package:wing_boat_racing_game/core/utils/boat_type.dart';
import 'package:wing_boat_racing_game/features/game/game.dart';
import 'package:wing_boat_racing_game/features/game/presentation/controllers/game_provider.dart';
import 'package:wing_boat_racing_game/features/game/presentation/widgets/river.dart';

class GameScreen extends HookConsumerWidget {
  final VoidCallback? onBackToMenu;
  const GameScreen({super.key, this.onBackToMenu});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);
    final timeCountDown = useState(4);

    final notifier = ref.watch(gameProvider.notifier);
    final game = ref.watch(gameProvider);
    Timer? _timer;

    void startGame() {
      timeCountDown.value = 4;
      Future.microtask(() {
        notifier.initGame();
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (timeCountDown.value > 0) {
          timeCountDown.value -= 1;
        } else {
          t.cancel();
          notifier.startGame(); // start only after countdown ends
        }
      });
    }

    useEffect(() {
      startGame();
      // FIXED: Added parentheses () to actually execute the cancel function on unmount
      return () => _timer?.cancel();
    }, []);

    String formatDuration(Duration duration) {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
      String milliseconds = ((duration.inMilliseconds % 1000) ~/ 10)
          .toString()
          .padLeft(2, '0');
      return "$minutes:$seconds.$milliseconds";
    }

    return Scaffold(
      body: Container(
        color: AppColors.riverBlueDark,
        child: Stack(
          alignment: .center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/phnom_penh_river.png',
                fit: BoxFit.cover,

                colorBlendMode: BlendMode.hardLight,
              ),
            ),

            // time record
            Positioned(
              top: 50.h,
              left: 10,
              right: 0,
              child: Text(
                formatDuration(
                  ref.read(gameProvider).elapsedTime ?? Duration.zero,
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // river path
            Row(
              mainAxisAlignment: .center,

              spacing: 13.h,
              children: [
                River(
                  boat: Boat(
                    type: BoatType.player,
                    boatImage: GameAssets.playerBoat,
                    position: game.playerPosition,
                  ),
                ),
                River(
                  boat: Boat(
                    type: BoatType.ai,
                    boatImage: GameAssets.aiBoat1,
                    position: game.firstAIPosition,
                  ),
                ),
                River(
                  boat: Boat(
                    type: BoatType.ai,
                    boatImage: GameAssets.aiBoat2,
                    position: game.secondAIPosition,
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

            if (ref.read(gameProvider).isGameOver)
              Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  alignment: .center,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceOut,
                    builder: (context, value, _) {
                      return Container(
                        width: 320.h * value,
                        height: 300.h * value,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            colors: [Colors.orangeAccent, Colors.deepOrange],
                          ),
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: Column(
                          mainAxisSize: .min,
                          mainAxisAlignment: .center,
                          spacing: 20.h,
                          children: [
                            Text(
                              ref.read(gameProvider).message ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .bold,
                                fontSize: 30.h,
                              ),
                            ),
                            Text(
                              '${game.elapsedTime!.inSeconds}s${game.elapsedTime!.inMilliseconds}ms',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .normal,
                                fontSize: 16.h,
                              ),
                            ),

                            Row(
                              mainAxisSize: .min,
                              spacing: 20.h,
                              children: [
                                ElevatedButton(
                                  onPressed: () => {startGame()},
                                  child: Text("Replay"),
                                ),
                                ElevatedButton(
                                  onPressed: onBackToMenu,
                                  child: Text("Menu"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
