import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/icons/flaticon/page.png',
                    width: 90,
                  ),
                  const Text(
                    '상품이 존재하지 않습니다.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
