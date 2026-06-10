import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wing_boat_racing_game/core/theme/app_theme.dart';
import 'package:wing_boat_racing_game/core/theme/theme_provider.dart';
import 'package:wing_boat_racing_game/router/router.dart';

void main() => runApp(ProviderScope(child: App()));

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return ScreenUtilPlusInit(
      splitScreenMode: true,
      designSize: Size(448, 997.3),
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: theme,
        routerConfig: router,
      ),
    );
  }
}
