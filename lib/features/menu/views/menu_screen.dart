import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/services/unicons.dart';

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
              icon: Unicons.svg('fi-rr-cross-small')),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(Gaps.size2),
        shrinkWrap: true,
        children: [
          Container(
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
                    Icons.arrow_forward_ios,
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
          Padding(
            padding: const EdgeInsets.only(left: Gaps.size2),
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
