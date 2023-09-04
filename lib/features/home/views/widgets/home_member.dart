import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/authentication/repos/authentication_repo.dart';
import 'package:hodoo_point/services/unicons.dart';

class HomeMember extends ConsumerWidget {
  const HomeMember({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authRepo);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(
                horizontal: Gaps.size2, vertical: Gaps.size2),
            child: authState
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '한진희님\n다양한 혜택을 즐겨보세요!',
                        style: TextStyle(
                            fontSize: 20, height: 1.2, color: Colors.blue[800]),
                      ),
                      Gaps.v2,
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Gaps.size1,
                                    vertical: Gaps.size1),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: <Color>[
                                      Theme.of(context).colorScheme.primary,
                                      Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.8),
                                      Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.2),
                                    ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: Unicons.svg(
                                                'fi-rr-angle-small-left',
                                                color: Colors.white),
                                          ),
                                          const Text(
                                            'MEMBERSHIP CARD',
                                            style: TextStyle(
                                                fontSize: 6,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Gaps.size4,
                                            vertical: Gaps.size2),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          'HD.POINT',
                                          style: TextStyle(
                                              letterSpacing: 0.1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Gaps.h1,
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                        child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Gaps.size1,
                                          vertical: Gaps.size1),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            child: Image.asset(
                                              'assets/images/icons/flaticon/free-icon-code-4565051.png',
                                            ),
                                          ),
                                          Gaps.h1,
                                          Text(
                                            '카드 등록',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          )
                                        ],
                                      ),
                                    )),
                                  ),
                                  Gaps.v1,
                                  Expanded(
                                    child: GestureDetector(
                                        child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Gaps.size1,
                                          vertical: Gaps.size1),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            child: Image.asset(
                                              'assets/images/icons/flaticon/free-icon-bank-4564970.png',
                                            ),
                                          ),
                                          Gaps.h1,
                                          Text(
                                            '계좌 등록',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          )
                                        ],
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v2,
                      Row(
                        children: [
                          const Text('1,000P',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 14)),
                          Gaps.h1,
                          CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 10,
                              child: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: Unicons.svg(
                                    'fi-rr-refresh',
                                  )))
                        ],
                      ),
                      Gaps.v2,
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
                      )
                    ],
                  )
                : Column(
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
                                    color: Colors.white,
                                    padding: EdgeInsets.zero),
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
                                    color: Colors.white,
                                    padding: EdgeInsets.zero),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v2,
                    ],
                  )),
        Positioned(
          right: 0,
          child: Switch(
              value: authState,
              onChanged: (value) {
                if (value) {
                  ref.read(authRepo.notifier).signIn();
                } else {
                  ref.read(authRepo.notifier).signOut();
                }
              }),
        ),
        Positioned(
          top: -10,
          right: 4,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(color: Colors.amber[100]),
              child: Text(
                '임시 로그인 토글',
                style: TextStyle(fontSize: 10, color: Colors.grey[500]),
              )),
        ),
      ],
    );
  }
}