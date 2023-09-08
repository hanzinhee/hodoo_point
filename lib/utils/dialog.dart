import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

Future<bool?> showConfirmDialog<bool>({
  Widget? title,
  Widget? content,
  String okLabel = '확인',
  String cancelLabel = '취소',
}) {
  return showHodooDialog<bool>(title: title, content: content, actions: [
    OutlinedButton(
      onPressed: () {
        RootNavigation.context.pop(false);
      },
      child: Text(cancelLabel),
    ),
    FilledButton(
      onPressed: () {
        RootNavigation.context.pop(true);
      },
      child: Text(okLabel),
    ),
  ]);
}

Future<T?> showHodooDialog<T>({
  Widget? title,
  Widget? content,
  List<Widget>? actions,
}) {
  return showDialog(
      context: RootNavigation.context,
      builder: (_) {
        return Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth * 0.7,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(Gaps.size2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: Gaps.size2),
                          child: DefaultTextStyle(
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              child: title),
                        ),
                      if (content != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: Gaps.size2),
                          child: DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                              child: content),
                        ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (var i = 0; i < actions!.length; i++)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: i == actions.length - 1 ? 0 : 8,
                                    left: i == 0 ? 0 : 8,
                                  ),
                                  child: Expanded(
                                      child: SizedBox(
                                          height: 45, child: actions[i])),
                                ),
                              ),
                          ],
                        ),
                      )
                      // actions ?? Container(),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      });
}
