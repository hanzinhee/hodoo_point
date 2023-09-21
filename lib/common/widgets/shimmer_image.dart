import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends CachedNetworkImage {
  ShimmerImage({
    super.key,
    required super.imageUrl,
    super.fit,
    super.width,
    super.height,
  }) : super(placeholder: (context, url) {
          return Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[100]!,
              child: Container(color: Colors.white));
        });
}
