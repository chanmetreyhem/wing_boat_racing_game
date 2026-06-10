import 'package:wing_boat_racing_game/core/utils/boat_type.dart';
class GameState {
  GameStatus status;
  double playerPosition;
  double firstAIPosition;
  double secondAIPosition;
  bool isGameOver;
  BoatType? winner;
  String? message;
  final Duration? elapsedTime;
  final double winDistance = 570.0;
  final double startPosition = 100;
  GameState({
    required this.status,
    required this.playerPosition,
    required this.firstAIPosition,
    required this.secondAIPosition,
    this.isGameOver = false,
    required this.winner,
    required this.message,
    required this.elapsedTime,
  });

  GameState copyWith({
    GameStatus? status,
    double? playerPosition,
    double? firstAIPosition,
    double? secondAIPosition,
    BoatType? winner,
    String? message,
    Duration? elapsedTime,
    bool? isGameOver,
  }) {
    return GameState(
      status: status ?? this.status,
      playerPosition: playerPosition ?? this.playerPosition,
      firstAIPosition: firstAIPosition ?? this.firstAIPosition,
      secondAIPosition: secondAIPosition ?? this.secondAIPosition,
      winner: winner ?? this.winner,
      isGameOver: isGameOver ?? this.isGameOver,
      message: message ?? this.message,
      elapsedTime: elapsedTime ?? this.elapsedTime,
    );
  }
}

enum GameStatus { idle, start, end }
