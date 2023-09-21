import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/widgets/empty_sign.dart';

class ShoppingInvalidProductScreen extends StatelessWidget {
  const ShoppingInvalidProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (context.canPop())
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            const Center(
              child: EmptySign(text: '상품이 존재하지 않습니다.'),
            ),
          ],
        ),
      ),
    );
  }
}
