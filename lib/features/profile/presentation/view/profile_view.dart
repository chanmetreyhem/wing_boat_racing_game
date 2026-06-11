import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    useEffect(() {
      return null;
    }, [selectedIndex.value]);
    return Scaffold(body: Center(child: Text('Profile Screen')));
  }
}
