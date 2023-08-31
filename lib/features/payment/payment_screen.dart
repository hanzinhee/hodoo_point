import 'package:flutter/material.dart';
import 'package:hodoo_point/features/payment/widgets/payment_slide_view.dart';
import 'package:hodoo_point/features/root/widgets/hodoo_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const String routePath = '/payment';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        const HoDooAppBar(),
        SliverFillRemaining(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height * 0.5,
                child: PaymentSlideView(),
              )
            ],
          ),
        ))
      ],
    );
  }
}
