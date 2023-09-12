import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

class NoticeAppBar extends SliverAppBar {
  NoticeAppBar({
    super.key,
    super.actions,
  }) : super(
            leading: RootNavigation.context.canPop()
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      RootNavigation.context.pop();
                    },
                  )
                : null,
            title: const Text('공지사항'),
            backgroundColor: Colors.blueGrey[50],
            centerTitle: true);
}
