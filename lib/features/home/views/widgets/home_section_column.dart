import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/services/unicons.dart';

class HomeSectionColumn extends StatelessWidget {
  const HomeSectionColumn(
      {super.key,
      required this.title,
      required this.children,
      this.routePath,
      this.isLast = false});
  final String title;
  final List<Widget> children;
  final String? routePath;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v2,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
          child: Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              if (routePath != null)
                SizedBox(
                    width: 18,
                    child: Unicons.svg('fi-rr-angle-small-right',
                        padding: EdgeInsets.zero))
            ],
          ),
        ),
        Gaps.v2,
        ...children,
        Gaps.v2,
        if (!isLast) Dividers.section,
      ],
    );
  }
}
