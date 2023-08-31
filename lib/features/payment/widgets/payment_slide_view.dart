import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/services/unicons.dart';

class PaymentSlideView extends StatefulWidget {
  const PaymentSlideView({super.key});

  @override
  State<PaymentSlideView> createState() => _PaymentSlideViewState();
}

class _PaymentSlideViewState extends State<PaymentSlideView> {
  final PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.7);
  int currentPage = 1;

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
    return Column(children: [
      Expanded(
        child: PageView.builder(
          itemBuilder: (_, index) {
            final List<Widget> items = [
              Center(
                child: AspectRatio(
                  aspectRatio: 1 / 1.58,
                  child: Container(
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
                              Text('카드 등록')
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
                              Text('계좌 등록')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: AspectRatio(
                  aspectRatio: 1 / 1.58,
                  child: Container(
                    padding: EdgeInsets.all(Gaps.size2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
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
                      Column(
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
                            child: Text(
                              '858P',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          );
                        }),
                      ),
                    ]),
                  ),
                ),
              )
            ];
            bool active = index == currentPage;

            return AnimatedContainer(
              transform: active
                  ? Matrix4.identity()
                  : (Matrix4.identity()..scale(0.8, 0.8)),
              padding: EdgeInsets.symmetric(horizontal: Gaps.size3),
              duration: const Duration(milliseconds: 300),
              child: items[index],
            );
          },
          itemCount: 2,
          controller: controller,
        ),
      ),
      Gaps.v2,
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
      )
    ]);

    // PageView(
    //   controller: controller,
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.symmetric(
    //           horizontal: Gaps.size2, vertical: Gaps.size6),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.5),
    //             blurRadius: 10,
    //             offset: const Offset(0, 3),
    //           ),
    //         ],
    //       ),
    //       child: Column(
    //         children: [
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset(
    //                   'assets/images/icons/flaticon/free-icon-code-4565051.png',
    //                   width: 50,
    //                 ),
    //                 Gaps.v1,
    //                 Text('카드 등록')
    //               ],
    //             ),
    //           ),
    //           const Divider(
    //             thickness: 0.5,
    //           ),
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset(
    //                   'assets/images/icons/flaticon/free-icon-bank-4564970.png',
    //                   width: 50,
    //                 ),
    //                 Gaps.v1,
    //                 Text('계좌 등록')
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     Container(
    //       margin: EdgeInsets.symmetric(
    //           horizontal: Gaps.size2, vertical: Gaps.size6),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.5),
    //             blurRadius: 10,
    //             offset: const Offset(0, 3),
    //           ),
    //         ],
    //       ),
    //       child: Column(
    //         children: [
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset(
    //                   'assets/images/icons/flaticon/free-icon-code-4565051.png',
    //                   width: 50,
    //                 ),
    //                 Gaps.v1,
    //                 Text('카드 등록')
    //               ],
    //             ),
    //           ),
    //           const Divider(
    //             thickness: 0.5,
    //           ),
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Image.asset(
    //                   'assets/images/icons/flaticon/free-icon-bank-4564970.png',
    //                   width: 50,
    //                 ),
    //                 Gaps.v1,
    //                 Text('계좌 등록')
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
