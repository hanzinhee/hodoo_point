import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/features/root/widgets/hodoo_app_bar.dart';
import 'package:hodoo_point/features/shopping/views/widgets/shopping_category_tab_bar.dart';
import 'package:hodoo_point/services/unicons.dart';
import 'package:hodoo_point/widgets/loop_banner.dart';

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
            Dividers.section
          ]),
        ),
        SliverPersistentHeader(
            pinned: true, delegate: ShoppingTabBarSliverHeader()),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.all(Gaps.size2),
            child: Column(
              children: [
                for (int i = 0; i < 11; i = i + 2)
                  Padding(
                    padding: const EdgeInsets.only(bottom: Gaps.size2),
                    child: Row(
                      children: [
                        for (int j = 0; j < 2; j++)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: j == 0 ? Gaps.size1 : 0,
                                  left: j == 1 ? Gaps.size1 : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            'https://picsum.photos/500/500/?vv=${i + j}'),
                                  ),
                                  const Text('원데이 홍삼 골드 50ml * 30포',
                                      style: TextStyle()),
                                  const Text('25,800원',
                                      style: TextStyle(
                                          letterSpacing: 0.3,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.blue)),
                                  Row(
                                    children: [
                                      const Text(
                                        '90%',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Gaps.h1,
                                      Text('596,000',
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey[700]))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ]))
      ],
    );
  }
}
