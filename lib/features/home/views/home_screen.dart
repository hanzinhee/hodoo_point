import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/features/home/views/widgets/home_member.dart';
import 'package:hodoo_point/features/home/views/widgets/home_section_container.dart';
import 'package:hodoo_point/features/root/widgets/root_app_bar.dart';
import 'package:hodoo_point/utils/unicons.dart';
import 'package:hodoo_point/utils/dialog.dart';
import 'package:hodoo_point/common/widgets/loop_banner.dart';
import 'package:hodoo_point/common/widgets/shopping_pruduct_thumbnail.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routePath = '/home';
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RootAppBar(
          actions: [
            IconButton(
              icon: Unicons.svg('fi-rr-search'),
              onPressed: () {
                showConfirmDialog(
                  title: const Text('Title'),
                  content:
                      const Text('lorem ipsum dolor sit amet consectetur '),
                );
              },
            ),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.symmetric(vertical: Gaps.size2),
            height: 180,
            child: LoopBanner(
              urls: [
                for (int i = 0; i < 5; i++)
                  'https://picsum.photos/400/400/?d=$i',
              ],
              viewportFraction: .9,
              margin: const EdgeInsets.symmetric(horizontal: Gaps.size1),
            ),
          ),
          const HomeMember(),
          Dividers.section,
          HomeSectionContainer(
            title: '쇼핑추천',
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: LoopBanner(
                    urls: [
                      for (int i = 0; i < 5; i++)
                        'https://picsum.photos/400/400/?a=$i',
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
                                    ShoppingProductThumbnail(
                                      imageUrl:
                                          'https://picsum.photos/400/400/?gg=$index',
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
                                    ShoppingProductThumbnail(
                                      imageUrl:
                                          'https://picsum.photos/400/400/?v=$index',
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
          HomeSectionContainer(
              title: '제휴사',
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Gaps.size2, vertical: Gaps.size1),
                    child: GestureDetector(
                      onTap: () async {
                        final Uri launchUri = Uri(
                            scheme: 'https',
                            path: 'play.google.com/store/apps/details',
                            queryParameters: {'id': 'com.blogpay.calin0928'});
                        await launchUrl(launchUri,
                            mode: LaunchMode.externalApplication);
                      },
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                    imageUrl:
                                        'https://play-lh.googleusercontent.com/sDptUGcZJJ0IwJjtCj887XMpvrUJjZ54Gxl8qDjvsKZe7MBdpHU0m0QcuIKo4v-FSvI=w480-h960-rw'),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('트렌디한 제작상품 판매',
                                        style: TextStyle(fontSize: 14)),
                                    const Text(
                                      '깔량 ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '#제작상품',
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Gaps.size2, vertical: Gaps.size1),
                    child: GestureDetector(
                      onTap: () async {
                        final Uri launchUri =
                            Uri(scheme: 'https', path: 'lupium.co.kr');
                        await launchUrl(launchUri,
                            mode: LaunchMode.externalApplication);
                      },
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            ClipOval(
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        'https://lupium.co.kr/_images/logo.png'),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('건강/뷰티 쇼핑몰',
                                        style: TextStyle(fontSize: 14)),
                                    const Text(
                                      '루피움',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '#뷰티',
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
                    ),
                  )
                ],
              )),
          HomeSectionContainer(
            title: '오늘의 미션',
            child: Column(
              children: List.generate(2, (index) {
                List<Map<String, dynamic>> items = [
                  {
                    'icon': Image.asset(
                      'assets/images/icons/flaticon/calendar_10691802.png',
                    ),
                    'title': '출석체크',
                    'subTitle': '참여 가능!'
                  },
                  {
                    'icon': Image.asset(
                      'assets/images/icons/flaticon/instagram_2111463.png',
                    ),
                    'title': '인스타그램 태깅',
                    'subTitle': '참여 가능!'
                  },
                ];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Gaps.size2, vertical: Gaps.size2),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(Gaps.size1),
                            width: 80,
                            child: items[index]['icon'] as Widget),
                        Gaps.h2,
                        VerticalDivider(
                          thickness: 0.5,
                          color: Colors.grey[200],
                        ),
                        Gaps.h2,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]['title'] as String,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              items[index]['subTitle'] as String,
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          child: Text('GO!'),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          HomeSectionContainer(
            title: '호두 플레이',
            isLast: true,
            child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: Gaps.size2,
                crossAxisSpacing: Gaps.size2,
                childAspectRatio: 6 / 5,
                children: [
                  for (int i = 0; i < 2; i++)
                    HodooPlayThumbnail(
                        title: '타이틀',
                        imageUrl: 'https://picsum.photos/400/400/?w=$i')
                ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Gaps.size2, vertical: Gaps.size2),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Row(
              children: [
                Text('공지',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor)),
                Gaps.h1,
                Expanded(
                  child: Text(
                    '[호두포인트] 개인정보처리방침 변경 안내',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          )
        ])),
      ],
    );
  }
}

class HodooPlayThumbnail extends StatelessWidget {
  const HodooPlayThumbnail({
    super.key,
    required this.imageUrl,
    required this.title,
  });
  final String imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: constraints.maxHeight * 0.3,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: const Text(
                        '참여 포인트 적립',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ));
                })
              ],
            ),
          ),
        ),
        if (title != null) ...[
          Gaps.v2,
          Text(title!, style: const TextStyle(fontSize: 16))
        ]
      ],
    );
  }
}
