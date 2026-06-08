import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RiverWaterBackground extends HookWidget {
  const RiverWaterBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller driving the flow speed of the river current
    final currentController = useAnimationController(
      duration: const Duration(seconds: 5),
    );

    useEffect(() {
      currentController.repeat();
      return null;
    }, []);

    // Scroll offsets for the separate current layers
    final primaryFlow = useAnimation(
      Tween<double>(begin: 0.0, end: 200.0).animate(currentController),
    );
    final secondaryFlow = useAnimation(
      Tween<double>(begin: 0.0, end: -150.0).animate(currentController),
    );

    return Stack(
      children: [
        // LAYER 1: Deep Base River Texture
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            color: Colors.teal.shade700,
            colorBlendMode: BlendMode.hardLight,
          ),
        ),

        // LAYER 2: Downstream Ripple Shading
        Positioned.fill(
          child: AnimatedBuilder(
            animation: currentController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, primaryFlow),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.06), // Whitecap highlights
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // LAYER 3: Cross-Current Shimmer Shading
        Positioned.fill(
          child: AnimatedBuilder(
            animation: currentController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-20, secondaryFlow), // Diagonal drift
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent,
                        Colors.cyanAccent.withOpacity(
                          0.04,
                        ), // Ambient water reflection
                        Colors.transparent,
                      ],
                      stops: const [0.2, 0.7, 1.0],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
