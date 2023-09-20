import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/utils/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  static const String routePath = '/menu';

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<bool> isExpandedList = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: Unicons.svg('fi-rr-home')),
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/flaticon/payment.svg',
                        width: 40,
                      ),
                      Gaps.v1,
                      const Text('송금')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/flaticon/point-charging.svg',
                        width: 40,
                      ),
                      Gaps.v1,
                      const Text('포인트 충전')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/flaticon/point-save.svg',
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
                      SvgPicture.asset(
                        'assets/images/icons/flaticon/change.svg',
                        width: 40,
                      ),
                      Gaps.v1,
                      const Text('전환')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/flaticon/atm.svg',
                        width: 40,
                      ),
                      Gaps.v1,
                      const Text('ATM출금')
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/flaticon/coupon.svg',
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
