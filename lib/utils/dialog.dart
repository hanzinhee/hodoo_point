import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

Future<bool?> showConfirmDialog<bool>({
  Widget? title,
  Widget? content,
  String okLabel = '확인',
  String cancelLabel = '취소',
}) {
  return showDialog(
      context: RootNavigation.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                RootNavigation.context.pop(false);
              },
              child: Text(cancelLabel),
            ),
            TextButton(
              onPressed: () {
                RootNavigation.context.pop(true);
              },
              child: Text(okLabel),
            ),
          ],
        );
      });
}
