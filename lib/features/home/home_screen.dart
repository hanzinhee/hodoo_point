import 'package:flutter/material.dart';
import 'package:hodoo_point/widgets/loop_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routePath = '/home';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 180,
          child: LoopBanner(urls: [
            'https://picsum.photos/400/400/?d=1',
            'https://picsum.photos/400/400/?d=2',
            'https://picsum.photos/400/400/?d=3',
            'https://picsum.photos/400/400/?d=4',
            'https://picsum.photos/400/400/?d=5',
          ]),
        )
      ],
    );
  }
}
