import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:wing_boat_racing_game/core/theme/theme.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        decoration: BoxDecoration(
          //color: Colors.red,
          // image: DecorationImage(
          //   image: AssetImage(GameAssets.menuBackground),
          //   fit: .cover,
          // ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: .min,

            children: [
              Text("Cambodia", style: context.textTheme.displayLarge),
              Text("ប្រទេសខ្មែរ", style: context.textTheme.headlineMedium),
              Text("ប្រទេសខ្មែរ", style: context.textTheme.titleLarge),
              Text("ប្រទេសខ្មែរ", style: context.textTheme.bodyLarge),
              Text("ប្រទេសខ្មែរ", style: context.textTheme.bodyMedium),
              ElevatedButton(
                onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
                child: Text(ref.read(themeProvider).name),
              ),
              // Image.asset(GameAssets.logoImage),
              // GestureDetector(
              //   onTap: () => context.pushNamed(AppRoute.game.name),
              //   child: Image.asset(
              //     GameAssets.playButton,
              //     width: 300,
              //     height: 80,
              //   ),
              // ),
              // SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
