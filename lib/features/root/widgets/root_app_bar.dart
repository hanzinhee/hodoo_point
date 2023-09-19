import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/features/menu/views/menu_screen.dart';
import 'package:hodoo_point/features/notifications/notifications_screen.dart';
import 'package:hodoo_point/utils/unicons.dart';

class RootAppBar extends StatelessWidget {
  const RootAppBar(
      {super.key,
      this.actions,
      this.backgroundColor,
      this.scrolledUnderElevation});
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: scrolledUnderElevation,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black26,
      floating: true,
      snap: true,
      leading: IconButton(
        icon: Unicons.svg('fi-rs-bell'),
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
