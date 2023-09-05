import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/features/root/widgets/hodoo_app_bar.dart';
import 'package:hodoo_point/features/shopping/views/widgets/shopping_category_tab.dart';
import 'package:hodoo_point/features/shopping/views/widgets/shopping_group_tab_bar.dart';
import 'package:hodoo_point/features/shopping/views/widgets/shopping_two_column_item_list.dart';
import 'package:hodoo_point/services/unicons.dart';
import 'package:hodoo_point/widgets/loop_banner.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  static const String routePath = '/shopping';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          HoDooAppBar(
            scrolledUnderElevation: 0,
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
              const SizedBox(
                height: 200,
                child: ShoppingCategoryTab(),
              ),
              Dividers.section
            ]),
          ),
          const SliverPersistentHeader(
              pinned: true, delegate: ShoppingGroupTabBarSliverHeader()),
          SliverList(
              delegate: SliverChildListDelegate([
            const ShoppingTwoColumnItemList(),
          ]))
        ],
      ),
    );
  }
}
