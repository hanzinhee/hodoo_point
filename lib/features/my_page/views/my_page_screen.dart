import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/authentication/states/auth_notifier.dart';
import 'package:hodoo_point/features/root/widgets/root_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});
  static String routePath = '/my_page';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {
  final List<bool> isExpandedList = [false, false];

  @override
  Widget build(BuildContext context) {
    final members = ref.watch(authProvider);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const RootAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: Gaps.size2),
                  padding: const EdgeInsets.all(Gaps.size2),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '마이 호두 포인트',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Gaps.v2,
                          Text('858 P',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  )),
              Gaps.v4,
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildIconButton(
                          icon: SvgPicture.asset(
                              'assets/images/icons/flaticon/payment-password.svg'),
                          label: '결제비밀번호'),
                      buildIconButton(
                          icon: SvgPicture.asset(
                              'assets/images/icons/flaticon/payment-management.svg'),
                          label: '결제수단관리'),
                      buildIconButton(
                          icon: SvgPicture.asset(
                              'assets/images/icons/flaticon/payment-history.svg'),
                          label: '결제내역'),
                    ],
                  ),
                  Gaps.v2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildIconButton(
                          icon: SvgPicture.asset(
                              'assets/images/icons/flaticon/point-history.svg'),
                          label: '포인트내역'),
                      buildIconButton(
                          icon: SvgPicture.asset(
                              'assets/images/icons/flaticon/coupon-2.svg'),
                          label: '쿠폰'),
                      buildIconButton(
                          icon: SvgPicture.asset(
                              'assets/images/icons/flaticon/payment-history.svg'),
                          label: '이벤트'),
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: Gaps.size2),
                child: ExpansionPanelList(
                  elevation: 0,
                  dividerColor: Colors.grey[300],
                  expandIconColor: Colors.blueAccent,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      isExpandedList[index] = isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      // canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return buildMenuHeader('포인트 • 결제');
                      },
                      body: Column(
                        children: [
                          Row(
                            children: [
                              buildMenuText('포인트 충전'),
                              Gaps.h5,
                              buildMenuText('포인트 전환'),
                            ],
                          ),
                          Gaps.v2,
                          Row(
                            children: [
                              buildMenuText('포인트 송금'),
                              Gaps.h5,
                              buildMenuText('포인트 환불'),
                            ],
                          ),
                        ],
                      ),
                      isExpanded: isExpandedList[0],
                    ),
                    ExpansionPanel(
                      // canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return buildMenuHeader('포인트 • 결제');
                      },
                      body: Column(
                        children: [
                          Row(
                            children: [
                              buildMenuText('포인트 충전'),
                              Gaps.h5,
                              buildMenuText('포인트 전환'),
                            ],
                          ),
                          Gaps.v2,
                          Row(
                            children: [
                              buildMenuText('포인트 송금'),
                              Gaps.h5,
                              buildMenuText('포인트 환불'),
                            ],
                          ),
                        ],
                      ),
                      isExpanded: isExpandedList[1],
                    ),
                  ],
                ),
              ),
              Gaps.v4,
              // Dividers.section,
              Container(
                // margin: const EdgeInsets.all(Gaps.size2),
                padding: const EdgeInsets.all(Gaps.size2),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  // borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '무엇을 도와드릴까요?',
                        style: TextStyle(color: Colors.grey[500], fontSize: 20),
                      ),
                      Gaps.v2,
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.push('/notice');
                              },
                              child: const Text(
                                '공지사항',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path: '1555-5555',
                                );
                                await launchUrl(launchUri);
                              },
                              child: const Text(
                                '문의 1555-5555',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget buildIconButton(
      {required Widget icon, required String label, VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 40, height: 40, child: icon),
            Gaps.v1,
            Text(label)
          ],
        ),
      ),
    );
  }

  Widget buildMenuHeader(String data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        data,
        style: const TextStyle(
            fontSize: 24,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildMenuText(String data, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Text(data,
          style: const TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
    );
  }
}
