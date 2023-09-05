import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';

class ShoppingCategoryTab extends StatelessWidget {
  const ShoppingCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final List<String> categoryPngs = [
      'assets/images/icons/flaticon/001.png',
      'assets/images/icons/flaticon/002.png',
      'assets/images/icons/flaticon/003.png',
      'assets/images/icons/flaticon/004.png',
      'assets/images/icons/flaticon/005.png',
      'assets/images/icons/flaticon/006.png',
      'assets/images/icons/flaticon/007.png',
      'assets/images/icons/flaticon/008.png',
      'assets/images/icons/flaticon/009.png',
      'assets/images/icons/flaticon/010.png',
      'assets/images/icons/flaticon/011.png',
      'assets/images/icons/flaticon/012.png',
      'assets/images/icons/flaticon/013.png',
      'assets/images/icons/flaticon/014.png',
      'assets/images/icons/flaticon/015.png',
      'assets/images/icons/flaticon/016.png',
      'assets/images/icons/flaticon/017.png',
      'assets/images/icons/flaticon/018.png',
      'assets/images/icons/flaticon/019.png',
      'assets/images/icons/flaticon/020.png',
    ];
    return LayoutBuilder(builder: (context, constraints) {
      return RawScrollbar(
        controller: scrollController,
        thickness: 5,
        radius: const Radius.circular(5),
        thumbVisibility: true,
        thumbColor: Colors.blueAccent,
        trackRadius: const Radius.circular(5),
        trackColor: Colors.grey[200],
        trackBorderColor: Colors.transparent,
        trackVisibility: true,
        padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 2 - 30, vertical: Gaps.size1),
        child: GridView.count(
          controller: scrollController,
          padding: const EdgeInsets.all(Gaps.size1),
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          children: [
            for (int i = 0; i < 10; i++)
              Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      categoryPngs[i],
                      width: 35,
                    ),
                  ),
                  Text(
                    '카테고리 $i',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Gaps.v2
                ],
              ),
          ],
        ),
      );
    });
  }
}
