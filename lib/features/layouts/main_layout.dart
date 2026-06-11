import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:wing_boat_racing_game/features/game/game.dart';
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
            children: [
              MenuScreen(),
              TrophyScreen(),
              GameScreen(
                onBackToMenu: () {
                  selectedIndex.value = 0;
                  pageViewController.jumpToPage(selectedIndex.value);
                },
              ),
              ProfileScreen(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Visibility(
        visible: selectedIndex.value != 2,
        child: NavigationBar(
          selectedIndex: selectedIndex.value,
          labelBehavior: .onlyShowSelected,
          onDestinationSelected: (value) {
            selectedIndex.value = value;
            if (pageViewController.hasClients) {
              pageViewController.jumpToPage(
                value,
                // duration: Duration(milliseconds: 300),
                // curve: Curves.bounceIn,
              );
            }
          },
          destinations: [
            NavigationDestination(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.list_number),
              label: 'Trophy',
            ),
            NavigationDestination(
              icon: Icon(Icons.play_circle_fill_outlined),
              label: 'Match',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
