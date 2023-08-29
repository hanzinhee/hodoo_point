import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/menu/menu_screen.dart';
import 'package:hodoo_point/features/notifications/notifications_screen.dart';

class RootScaffold extends StatelessWidget {
  const RootScaffold(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: false,
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  context.push(NotificationScreen.routePath);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    context.push(MenuScreen.routePath);
                  },
                ),
              ],
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                sliver: SliverFillRemaining(
                    hasScrollBody: false, child: navigationShell))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        backgroundColor: Colors.white,
        // selectedItemColor: hodooBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
        selectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '해택'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: '쇼핑'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: '결제'),
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: '라운지'),
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
