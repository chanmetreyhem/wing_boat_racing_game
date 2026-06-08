import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class Boat extends HookWidget {
  final String boatImage;
  const Boat({super.key, required this.boatImage});

  @override
  Widget build(BuildContext context) {
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

    late double speed = 20;
    final startPosition = 40.w;

    final position = useState<double>(startPosition);

    useEffect(() {
      animationController.repeat(reverse: true);

      return null;
    }, const []);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      bottom: position.value + floatingAnimation,
      curve: Curves.easeOutQuad,
      child: GestureDetector(
        onTap: () {
          position.value += speed;
        },
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
              Text("You", style: TextStyle(color: Colors.white)),
              Text("${position.value}", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
