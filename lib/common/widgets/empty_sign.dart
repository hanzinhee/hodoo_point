import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hodoo_point/constants/gaps.dart';

class EmptySign extends StatelessWidget {
  const EmptySign({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/icons/flaticon/empty-box.svg',
          width: 90,
        ),
        if (text != null) ...[
          Gaps.v1,
          Text(
            text!,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ],
    );
  }
}
