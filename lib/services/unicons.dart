import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hodoo_point/constants/gaps.dart';

class Unicons {
  static const String path = 'assets/images/icons/unicons/';

  static Widget svg(String name, {Color? color}) {
    final ColorFilter? colorFilter =
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset('$path$name.svg', colorFilter: colorFilter),
    );
  }
}