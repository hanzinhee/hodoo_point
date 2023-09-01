import 'package:flutter/material.dart';
import 'package:hodoo_point/features/payment/widgets/payment_slide_view.dart';
import 'package:hodoo_point/features/root/widgets/hodoo_app_bar.dart';
import 'package:hodoo_point/services/unicons.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const String routePath = '/payment';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[200],
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          HoDooAppBar(
            backgroundColor: Colors.grey[200],
            actions: [
              IconButton(
                icon: Unicons.svg('fi-rr-ticket'),
                onPressed: () {},
              ),
            ],
          ),
          SliverFillRemaining(child: SizedBox(child: PaymentSlideView()))
        ],
      ),
    );
  }
}
