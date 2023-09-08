import 'package:flutter/material.dart';

class RootNavigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Future<T?> showHodooDialog<T>({
    Widget? title,
    Widget? content,
    List<Widget>? actions,
  }) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog();
        });
  }
}
