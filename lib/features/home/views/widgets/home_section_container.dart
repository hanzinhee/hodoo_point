import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/utils/unicons.dart';

class HomeSectionContainer extends StatelessWidget {
  const HomeSectionContainer(
      {super.key,
      required this.title,
      required this.child,
      this.routePath,
      this.isLast = false});
  final String title;
  final Widget child;
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
        child,
        Gaps.v2,
        if (!isLast) Dividers.section,
      ],
    );
  }
}
