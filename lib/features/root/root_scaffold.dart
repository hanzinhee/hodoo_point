import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/services/navigation_service.dart';
import 'package:hodoo_point/services/unicons.dart';

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
          _buildBarItem(uniconsName: 'fi-sr-star', label: '해택'),
          _buildBarItem(uniconsName: 'fi-sr-shopping-bag', label: '쇼핑'),
          _buildBarItem(uniconsName: 'fi-sr-credit-card', label: '결제'),
          _buildBarItem(uniconsName: 'fi-sr-coffee', label: '라운지'),
        ],
        onTap: _onTap,
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem({
    required String uniconsName,
    required String label,
  }) {
    final activeColor = Theme.of(NavigationService.context).colorScheme.primary;
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
