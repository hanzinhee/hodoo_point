import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/common/widgets/shopping_pruduct_thumbnail.dart';

class ShoppingTwoColumnItemList extends StatelessWidget {
  const ShoppingTwoColumnItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Gaps.size2),
      child: Column(
        children: [
          for (int i = 0; i < 12; i = i + 2)
            Padding(
              padding: const EdgeInsets.only(bottom: Gaps.size2),
              child: Row(
                children: [
                  for (int j = 0; j < 2; j++)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: j == 0 ? Gaps.size1 : 0,
                            left: j == 1 ? Gaps.size1 : 0),
                        child: GestureDetector(
                          onTap: () {
                            context.push('/shopping/product/$i');
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShoppingProductThumbnail(
                                imageUrl:
                                    'https://picsum.photos/400/400/?qvv=${i + j}',
                              ),
                              const Text('원데이 홍삼 골드 50ml * 30포',
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
                      ),
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
