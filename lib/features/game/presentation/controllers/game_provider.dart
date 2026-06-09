import 'dart:async';
import 'dart:math';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wing_boat_racing_game/features/game/domain/game_state.dart';

final gameProvider = NotifierProvider<GameStateNotifier, GameState>(
  GameStateNotifier.new,
);

class GameStateNotifier extends Notifier<GameState> {
  @override
  GameState build() {
    state = GameState(status: GameStatus.idle, position: 0);
    return state;
  }

  Future<void> startGame() async {
    await Future.delayed(Duration(milliseconds: 500));

    state = state.copyWith(
      status: GameStatus.start,
      position: state.startPosition,
    );
  }

  void checkWin(double position) {
    if (position >= state.winDistance + 80) {
      state = state.copyWith(status: GameStatus.end);
    }
  }

  void move() {
    if (state.status != GameStatus.start) return;
    Random random = Random();
    double randSpeed = 20 + random.nextDouble() * (40 - 20);
    state = state.copyWith(position: state.position + randSpeed);
    checkWin(state.position);
  }
}
