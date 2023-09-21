import 'package:flutter/material.dart';
import 'package:hodoo_point/widgets/shimmer_image.dart';

class ShoppingProductThumbnail extends StatelessWidget {
  const ShoppingProductThumbnail({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ShimmerImage(imageUrl: imageUrl)),
    );
  }
}
