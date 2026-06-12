import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:wing_boat_racing_game/features/menu/presentation/view/menu_view.dart';
import 'package:wing_boat_racing_game/features/profile/presentation/view/profile_view.dart';
import 'package:wing_boat_racing_game/features/trophy/presentation/view/trophy_view.dart';

class MainLayout extends HookConsumerWidget {
  const MainLayout({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final pageViewController = usePageController(
      initialPage: selectedIndex.value,
    );
    useEffect(() {
      return null;
    }, [selectedIndex.value]);
    return Scaffold(
      body: Expanded(
        child: SizedBox(
          child: PageView(
            onPageChanged: (value) => selectedIndex.value = value,
            controller: pageViewController,
            physics: const NeverScrollableScrollPhysics(),
            children: [MenuScreen(), TrophyScreen(), ProfileScreen()],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.amber,
        //indicatorColor: Colors.red,
        selectedIndex: selectedIndex.value,
        labelBehavior: .alwaysHide,
        onDestinationSelected: (value) {
          selectedIndex.value = value;
          if (pageViewController.hasClients) {
            pageViewController.jumpToPage(value);
          }
        },

        destinations: [
          NavigationDestination(
            icon: Icon(RemixIcons.home_2_fill),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(RemixIcons.trophy_fill),
            label: 'Trophy',
          ),

          NavigationDestination(
            icon: Icon(RemixIcons.user_fill),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
