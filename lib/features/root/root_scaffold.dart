import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/utils/unicons.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

class RootScaffold extends StatelessWidget {
  const RootScaffold(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
        selectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBarItem(uniconsName: 'fi-sr-gift', label: '해택'),
          _buildBarItem(uniconsName: 'fi-sr-shopping-bag', label: '쇼핑'),
          _buildBarItem(uniconsName: 'fi-sr-credit-card', label: '결제'),
          _buildBarItem(uniconsName: 'fi-sr-settings', label: '설정'),
        ],
        onTap: _onTap,
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem({
    required String uniconsName,
    required String label,
  }) {
    final activeColor = Theme.of(RootNavigation.context).colorScheme.primary;
    return BottomNavigationBarItem(
        icon: Unicons.svg(uniconsName,
            padding: const EdgeInsets.symmetric(vertical: 8)),
        activeIcon: Unicons.svg(uniconsName,
            color: activeColor,
            padding: const EdgeInsets.symmetric(vertical: 8)),
        label: label);
  }

  void _onTap(index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
