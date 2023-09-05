import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/services/navigation_service.dart';

class HodooAppBar extends AppBar {
  HodooAppBar({
    super.key,
    super.title,
    super.actions,
    super.backgroundColor,
  }) : super(
          leading: NavigationService.context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    NavigationService.context.pop();
                  },
                )
              : null,
        );
}
