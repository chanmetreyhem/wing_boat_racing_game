import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wing_boat_racing_game/features/game/domain/game_state.dart';

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);

class GameNotifier extends Notifier<GameState> {
  @override
  GameState build() {
    return GameState();
  }
}
