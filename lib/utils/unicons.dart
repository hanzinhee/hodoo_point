import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Unicons {
  static const String path = 'assets/images/icons/unicons/';

  static Widget svg(String name,
      {Color? color, EdgeInsets padding = EdgeInsets.zero, double width = 24}) {
    final ColorFilter? colorFilter =
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null;
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        '$path$name.svg',
        colorFilter: colorFilter,
        width: width,
      ),
    );
  }
}
