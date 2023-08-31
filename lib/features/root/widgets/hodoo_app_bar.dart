import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/features/menu/menu_screen.dart';
import 'package:hodoo_point/features/notifications/notifications_screen.dart';
import 'package:hodoo_point/services/unicons.dart';

class HoDooAppBar extends StatelessWidget {
  const HoDooAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
          icon: Unicons.svg('fi-rr-search'),
          onPressed: () {},
        ),
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
