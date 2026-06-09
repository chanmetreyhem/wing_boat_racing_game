// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameState {
  GameStatus status;
  double position;
  final double winDistance = 570.0;
  final double startPosition = 100;
  GameState({required this.status, required this.position});

  GameState copyWith({GameStatus? status, double? position}) {
    return GameState(
      status: status ?? this.status,
      position: position ?? this.position,
    );
  }
}

enum GameStatus { idle, start, end }
