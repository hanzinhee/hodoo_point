import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/root/widgets/hodoo_app_bar.dart';
import 'package:hodoo_point/services/unicons.dart';
import 'package:hodoo_point/widgets/loop_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routePath = '/home';
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HoDooAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.symmetric(vertical: Gaps.size2),
            height: 180,
            child: LoopBanner(urls: [
              for (int i = 0; i < 5; i++) 'https://picsum.photos/400/400/?d=$i',
            ]),
          ),
          Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Gaps.size2, vertical: Gaps.size2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '로그인 하시고\n다양한 혜택을 즐겨보세요!',
                    style: TextStyle(
                        fontSize: 20, height: 1.2, color: Colors.blue[800]),
                  ),
                  Gaps.v2,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: Gaps.size2),
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0,
                          ),
                          label: const Text('로그인'),
                          icon: SizedBox(
                            width: 18,
                            child: Unicons.svg('fi-sr-user',
                                color: Colors.white, padding: EdgeInsets.zero),
                          ),
                        ),
                      ),
                      Gaps.h1,
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: Gaps.size2),
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0,
                          ),
                          label: const Text('회원가입'),
                          icon: SizedBox(
                            width: 18,
                            child: Unicons.svg('fi-sr-user-add',
                                color: Colors.white, padding: EdgeInsets.zero),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: Gaps.size2, vertical: Gaps.size2),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/icons/flaticon/free-icon-payment-4565114.png',
                          width: 40,
                        ),
                        Gaps.v1,
                        const Text('송금')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/icons/flaticon/free-icon-refund-4117938.png',
                          width: 40,
                        ),
                        Gaps.v1,
                        const Text('포인트 충전')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/icons/flaticon/free-icon-smartphone-4116978.png',
                          width: 40,
                        ),
                        Gaps.v1,
                        const Text('적립')
                      ],
                    )
                  ],
                ),
                Gaps.v2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/icons/flaticon/free-icon-payment-4565110.png',
                          width: 40,
                        ),
                        Gaps.v1,
                        const Text('전환')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/icons/flaticon/free-icon-cash-withdrawal-4117790.png',
                          width: 40,
                        ),
                        Gaps.v1,
                        const Text('ATM출금')
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/icons/flaticon/free-icon-coupon-4396750.png',
                          width: 40,
                        ),
                        Gaps.v1,
                        const Text('쿠폰')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: Gaps.size1,
            color: Colors.grey[200],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: Gaps.size2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                  child: Row(
                    children: [
                      const Text(
                        '쇼핑추천',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                          width: 18,
                          child: Unicons.svg('fi-rr-angle-small-right',
                              padding: EdgeInsets.zero))
                    ],
                  ),
                ),
                Gaps.v2,
                SizedBox(
                  height: 180,
                  child: LoopBanner(
                    urls: [
                      for (int i = 0; i < 5; i++)
                        'https://picsum.photos/400/400/?a=$i',
                    ],
                    viewportFraction: 1.0,
                    margin: EdgeInsets.symmetric(horizontal: Gaps.size2),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Gaps.size2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: Gaps.size2),
                        child: Text(
                          '베스트 상품',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Gaps.v2,
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: Gaps.size2),
                              child: SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CachedNetworkImage(
                                            imageUrl:
                                                'https://picsum.photos/400/400/?s=$index'),
                                      ),
                                    ),
                                    const Text('1+1특가 [허니버터칩] 60g',
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Gaps.size2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: Gaps.size2),
                        child: Text(
                          '추천 픽 상품',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Gaps.v2,
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: Gaps.size2),
                              child: SizedBox(
                                width: 150,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: CachedNetworkImage(
                                            imageUrl:
                                                'https://picsum.photos/400/400/?v=$index'),
                                      ),
                                    ),
                                    const Text('1+1특가 [허니버터칩] 60g',
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: Gaps.size1,
            color: Colors.grey[200],
          ),
          Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Gaps.size2, vertical: Gaps.size2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '제휴사',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            width: 18,
                            child: Unicons.svg('fi-rr-angle-small-right',
                                padding: EdgeInsets.zero))
                      ],
                    ),
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: Gaps.size1),
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          'https://picsum.photos/400/400/?u=$i'),
                                ),
                              ),
                              Gaps.h2,
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Gaps.size1),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('필요한 가구는 내가 직접!',
                                          style: TextStyle(fontSize: 14)),
                                      const Text(
                                        '가구제작쇼핑몰 ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '#인스타 #가구제작 #가구공방 #주말공방 #DIY',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]!),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ])),
        ])),
      ],
    );
  }
}
