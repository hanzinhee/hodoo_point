import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/features/menu/menu_screen.dart';
import 'package:hodoo_point/features/notifications/notifications_screen.dart';
import 'package:hodoo_point/services/unicons.dart';

class HoDooAppBar extends StatelessWidget {
  const HoDooAppBar({super.key, this.actions, this.backgroundColor});
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      shadowColor: Colors.black26,
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
        if (actions != null) ...actions!,
        IconButton(
          icon: Unicons.svg('fi-rr-menu-burger'),
          onPressed: () {
            context.push(MenuScreen.routePath);
          },
        ),
      ],
    );
  }
}
