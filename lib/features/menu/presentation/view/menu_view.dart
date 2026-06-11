import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class MenuScreen extends HookConsumerWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Center(child: Text('Menu Screen')));
  }
}
