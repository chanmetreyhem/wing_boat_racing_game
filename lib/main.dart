import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wing_boat_racing_game/router/router.dart';

void main() => runApp(ProviderScope(child: App()));

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      splitScreenMode: true,
      designSize: Size(448, 997.3),
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
