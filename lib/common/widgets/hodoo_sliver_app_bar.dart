import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

class HodooSliverAppBar extends SliverAppBar {
  HodooSliverAppBar({
    super.key,
    super.title,
    super.actions,
    super.backgroundColor,
  }) : super(
          leading: RootNavigation.context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    RootNavigation.context.pop();
                  },
                )
              : null,
          floating: true,
          snap: true,
        );
}
