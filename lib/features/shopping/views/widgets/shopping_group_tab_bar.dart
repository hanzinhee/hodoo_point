import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ShoppingGroupTabBar extends StatefulWidget {
  const ShoppingGroupTabBar({
    super.key,
  });

  @override
  State<ShoppingGroupTabBar> createState() => _ShoppingGroupTabBarState();
}

class _ShoppingGroupTabBarState extends State<ShoppingGroupTabBar> {
  final ItemScrollController itemScrollController = ItemScrollController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
            ),
          )),
      child: ScrollablePositionedList.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                itemScrollController.scrollTo(
                  index: index,
                  duration: const Duration(milliseconds: 300),
                  // curve: Curves.easeInOutCubic
                );
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Gaps.size1),
              child: IntrinsicWidth(
                child: Stack(
                  children: [
                    Center(child: Text('Shopping${index + 1}')),
                    if (index == currentIndex)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 3,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )),
        itemScrollController: itemScrollController,
      ),
    );
  }
}

class ShoppingGroupTabBarSliverHeader extends SliverPersistentHeaderDelegate {
  const ShoppingGroupTabBarSliverHeader();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const ShoppingGroupTabBar();
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
