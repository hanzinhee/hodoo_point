import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/colors.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/menu/menu_screen.dart';
import 'package:hodoo_point/features/notifications/notifications_screen.dart';
import 'package:hodoo_point/services/unicons.dart';

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
                icon: Unicons.svg('fi-rr-bell'),
                onPressed: () {
                  context.push(NotificationScreen.routePath);
                },
              ),
              actions: [
                IconButton(
                  icon: Unicons.svg('fi-rr-menu-burger'),
                  onPressed: () {
                    context.push(MenuScreen.routePath);
                  },
                ),
              ],
            ),
            SliverFillRemaining(hasScrollBody: false, child: navigationShell)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
        selectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Unicons.svg('fi-sr-star'),
              activeIcon: Unicons.svg('fi-sr-star',
                  color: Theme.of(context).colorScheme.primary),
              label: '해택'),
          BottomNavigationBarItem(
              icon: Unicons.svg('fi-sr-shopping-bag'),
              activeIcon: Unicons.svg('fi-sr-shopping-bag',
                  color: Theme.of(context).colorScheme.primary),
              label: '쇼핑'),
          BottomNavigationBarItem(
              icon: Unicons.svg('fi-sr-credit-card'),
              activeIcon: Unicons.svg('fi-sr-credit-card',
                  color: Theme.of(context).colorScheme.primary),
              label: '결제'),
          BottomNavigationBarItem(
              icon: Unicons.svg('fi-sr-coffee'),
              activeIcon: Unicons.svg('fi-sr-coffee',
                  color: Theme.of(context).colorScheme.primary),
              label: '라운지'),
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
