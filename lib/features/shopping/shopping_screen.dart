import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/features/root/widgets/hodoo_app_bar.dart';
import 'package:hodoo_point/services/unicons.dart';
import 'package:hodoo_point/widgets/loop_banner.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  static const String routePath = '/shopping';
  @override
  Widget build(BuildContext context) {
    final categoryPngs = [
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

    return CustomScrollView(
      slivers: [
        HoDooAppBar(
          actions: [
            IconButton(
              icon: Unicons.svg('fi-rr-heart'),
              onPressed: () {},
            ),
            IconButton(
              icon: Unicons.svg('fi-rr-document-signed'),
              onPressed: () {},
            ),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 200,
            child: LoopBanner(
              urls: [
                for (int i = 0; i < 5; i++)
                  'https://picsum.photos/400/400/?shop=$i',
              ],
              viewportFraction: 1,
              margin: EdgeInsets.zero,
              borderRadius: BorderRadius.zero,
              indicatorRight: Gaps.size1,
            ),
          ),
          SizedBox(
            height: 200,
            child: GridView.count(
              padding: const EdgeInsets.all(Gaps.size1),
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              children: [
                for (int i = 0; i < 20; i++)
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
          ),
          Dividers.section,
          ShoppingCategoryTabBar()
        ]))
      ],
    );
  }
}

class ShoppingCategoryTabBar extends StatefulWidget {
  const ShoppingCategoryTabBar({
    super.key,
  });

  @override
  State<ShoppingCategoryTabBar> createState() => _ShoppingCategoryTabBarState();
}

class _ShoppingCategoryTabBarState extends State<ShoppingCategoryTabBar> {
  final ItemScrollController itemScrollController = ItemScrollController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
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
                          decoration: BoxDecoration(
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
