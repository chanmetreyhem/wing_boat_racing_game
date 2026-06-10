import 'dart:async';
import 'dart:math';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wing_boat_racing_game/core/utils/boat_type.dart';
import 'package:wing_boat_racing_game/features/game/domain/game_state.dart';

final gameProvider = NotifierProvider<GameStateNotifier, GameState>(
  GameStateNotifier.new,
);

class GameStateNotifier extends Notifier<GameState> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Timer? _aiTimer;
  double minSpeed = 5;
  double maxSpeed = 15;
  @override
  GameState build() {
    state = GameState(
      status: GameStatus.idle,
      playerPosition: 0,
      winner: null,
      message: '',
      elapsedTime: null,
      firstAIPosition: 0,
      secondAIPosition: 0,
    );
    return state;
  }

  void initGame() {
    _stopwatch.reset();
    _stopwatch.stop();
    _timer?.cancel();
    _aiTimer?.cancel();

    state = state.copyWith(
      elapsedTime: Duration.zero,
      playerPosition: state.startPosition,
      firstAIPosition: state.startPosition,
      secondAIPosition: state.startPosition,
      isGameOver: false,
      winner: null,
      message: '',
    );
  }

  Future<void> startGame() async {
    await Future.delayed(Duration(milliseconds: 10));
    state = state.copyWith(
      status: GameStatus.start,
      playerPosition: state.startPosition,
    );

    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      state = state.copyWith(elapsedTime: _stopwatch.elapsed);
    });

    _aiTimer = Timer.periodic(Duration(milliseconds: 300), (t) {
      if (state.status == GameStatus.start) {
        firstAIMove();
        secondAIMove();
      }
    });
  }

  void checkWin(double position, BoatType boat) {
    if (position >= state.winDistance.h + 60.h) {
      _stopwatch.stop();
      _timer?.cancel();
      _aiTimer?.cancel();

      state = state.copyWith(status: GameStatus.end, isGameOver: true);

      if (boat == BoatType.player) {
        state = state.copyWith(message: "You Win");
      } else {
        state = state.copyWith(message: "You Lose");
      }
    }
  }

  void move() {
    if (state.status != GameStatus.start) return;
    double randSpeed = getRandomSpeed();
    state = state.copyWith(playerPosition: state.playerPosition + randSpeed);
    checkWin(state.playerPosition, BoatType.player);
  }

  void firstAIMove() {
    double randSpeed = getRandomSpeed();
    state = state.copyWith(firstAIPosition: state.firstAIPosition + randSpeed);
    checkWin(state.secondAIPosition, BoatType.ai);
  }

  void secondAIMove() {
    double randSpeed = getRandomSpeed();
    state = state.copyWith(
      secondAIPosition: state.secondAIPosition + randSpeed,
    );
    checkWin(state.secondAIPosition, BoatType.ai);
  }

  double getRandomSpeed() {
    Random random = Random();
    double randSpeed = minSpeed + random.nextDouble() * (maxSpeed - minSpeed);
    return randSpeed;
  }
}
