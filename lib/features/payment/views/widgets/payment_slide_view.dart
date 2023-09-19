import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/features/payment/views/widgets/point_card_sheet.dart';
import 'package:hodoo_point/utils/unicons.dart';

class PaymentSlideView extends StatefulWidget {
  const PaymentSlideView({super.key});

  @override
  State<PaymentSlideView> createState() => _PaymentSlideViewState();
}

class _PaymentSlideViewState extends State<PaymentSlideView> {
  final PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.6);
  int currentPage = 1;

  void showPointCardSheet() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return const PointCardSheet();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    controller.addListener(() {
      int pos = controller.page!.round();
      if (currentPage != pos) {
        {
          setState(() {
            currentPage = pos;
            // cancel the timer when user starts scrolling manually
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: constraints.maxHeight * 0.6,
          child: PageView.builder(
            itemBuilder: (_, index) {
              final List<Widget> items = [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/icons/flaticon/free-icon-code-4565051.png',
                              width: 60,
                            ),
                            Gaps.v1,
                            const Text('카드 등록')
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/icons/flaticon/free-icon-bank-4564970.png',
                              width: 60,
                            ),
                            Gaps.v1,
                            const Text('계좌 등록')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPointCardSheet();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(Gaps.size2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.blue[700]!,
                          Colors.blue[100]!,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Hodoo Point',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'MEMBERSHIP\nCARD',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Center(
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth * 0.5,
                            height: constraints.maxHeight * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              '858P',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          );
                        }),
                      ),
                    ]),
                  ),
                )
              ];
              bool active = index == currentPage;

              return AnimatedContainer(
                alignment: Alignment.center,
                transformAlignment: Alignment.center,
                transform: active
                    ? Matrix4.identity()
                    : (Matrix4.identity()..scale(0.8)),
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Gaps.size2),
                  child:
                      AspectRatio(aspectRatio: 1 / 1.58, child: items[index]),
                ),
              );
            },
            itemCount: 2,
            controller: controller,
          ),
        ),
        Gaps.v3,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 15,
              height: 15,
              child: Unicons.svg(
                'fi-rr-add',
                color: currentPage == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            Gaps.h1,
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: currentPage == 1 ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
        Gaps.v5,
        if (currentPage == 0)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    child: Unicons.svg('fi-rr-settings',
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Gaps.h1,
                  const Text(
                    '결제수단 관리',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        if (currentPage == 1)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    child: Unicons.svg('fi-rr-marker',
                        color: Theme.of(context).primaryColor),
                  ),
                  Gaps.h1,
                  const Text(
                    '사용처',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Gaps.h2,
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    child: Unicons.svg('fi-rs-chart-pie-alt',
                        color: Theme.of(context).primaryColor),
                  ),
                  Gaps.h1,
                  const Text(
                    '이용내역 ',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              Gaps.h2,
              Row(
                children: [
                  SizedBox(
                    width: 16,
                    child: Unicons.svg('fi-rr-receipt',
                        color: Theme.of(context).primaryColor),
                  ),
                  Gaps.h1,
                  const Text(
                    '충전',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ],
          ),
      ]);
    });
  }
}
