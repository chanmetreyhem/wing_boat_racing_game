import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'package:flutter/material.dart';
import 'package:wing_boat_racing_game/core/theme/theme.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider.notifier);
    final theme = ref.watch(themeProvider);
    return Scaffold(
      body: Center(
        child: Switch(
          value: theme.isDark,
          onChanged: (value) {
            themeNotifier.toggleTheme();
          },
        ),
      ),
    );
  }
}
