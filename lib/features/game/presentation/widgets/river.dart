import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wing_boat_racing_game/features/game/presentation/controllers/game_provider.dart';
import 'package:wing_boat_racing_game/features/game/presentation/widgets/boat.dart';

class River extends ConsumerWidget {
  final Boat boat;
  const River({super.key, required this.boat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 60.h,
      color: Colors.black.withOpacity(0.5),
      child: Stack(
        alignment: .bottomCenter,
        children: [
          // finish line
          Positioned(
            bottom: ref.watch(gameProvider.select((s) => s.winDistance)) + 140,
            child: Container(width: 100.w, height: 8, color: Colors.red),
          ),

          // boat
          boat,
        ],
      ),
    );
  }
}
