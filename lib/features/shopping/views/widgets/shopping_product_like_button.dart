import 'package:flutter/material.dart';
import 'package:hodoo_point/utils/unicons.dart';

class ShoppingProductLikeButton extends StatelessWidget {
  const ShoppingProductLikeButton(
      {super.key, this.isLiked = false, this.onTap});
  final bool isLiked;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: isLiked
              ? Unicons.svg('fi-sr-heart', color: Colors.redAccent)
              : Unicons.svg('fi-rr-heart', color: Colors.grey)),
    );
  }
}
