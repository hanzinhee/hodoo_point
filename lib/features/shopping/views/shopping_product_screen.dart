import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/shopping/views/widgets/shopping_buy_option_sheet.dart';
import 'package:hodoo_point/features/shopping/views/widgets/shopping_product_like_button.dart';
import 'package:hodoo_point/widgets/hodoo_sliver_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShoppingProductScreen extends StatefulWidget {
  const ShoppingProductScreen({super.key, required this.productId});

  final int productId;

  static const routePath = '/shopping/product/:productId';

  @override
  State<ShoppingProductScreen> createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen> {
  final pageController = PageController();
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomScrollView(
            slivers: [
              HodooSliverAppBar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (int i = 0; i < 3; i++)
                            CachedNetworkImage(
                                imageUrl:
                                    'https://picsum.photos/500/500/?vv=${widget.productId + i}'),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(Gaps.size1),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: const SlideEffect(
                              dotWidth: 10,
                              dotHeight: 10,
                              dotColor: Colors.white60,
                              activeDotColor: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Gaps.size2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 상품 제목
                      const Text('원데이 홍삼 골드 50ml * 30포',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w200)),
                      Gaps.v2,
                      // 가격
                      Row(
                        children: [
                          Gaps.h1,
                          Text('596,000',
                              style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey[600],
                                  color: Colors.grey[600])),
                          Gaps.h1,
                          const Text('25,800원',
                              style: TextStyle(
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.blue)),
                          Gaps.h1,
                          const Text(
                            '90%',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      // 배송비
                      Gaps.v2,
                      const Text('배송비'),
                      const Text('3000원 (500,000원 이상 무료배송)',
                          style: TextStyle(color: Colors.grey)),
                      Gaps.v2,
                      const Text('도서산간인 경우 추가배송비가 부과됩니다.\n도서산간지역 8,000원',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                CachedNetworkImage(
                    imageUrl:
                        'https://picsum.photos/500/3000/?vv=${widget.productId}'),
                const ListTile(
                  title: Text('상품 기본정보'),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
                Gaps.v10
              ])),
            ],
          ),
          // bottom sheet
          Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                minimum: const EdgeInsets.only(bottom: Gaps.size2),
                child: Container(
                  padding: const EdgeInsets.only(
                    right: Gaps.size2,
                    left: Gaps.size2,
                    top: Gaps.size3,
                  ),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      children: [
                        ShoppingProductLikeButton(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          isLiked: isLiked,
                        ),
                        Gaps.h2,
                        Expanded(
                            child: SizedBox(
                          height: 50,
                          child: FilledButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const ShoppingBuyOptionSheet();
                                    });
                              },
                              child: const Text('구매하기')),
                        )),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
