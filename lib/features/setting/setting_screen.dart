import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/common/widgets/hodoo_sliver_app_bar.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});
  static String routePath = '/setting';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  bool chacked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        HodooSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Gaps.size2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('기본서비스설정',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('로그인 설정', style: TextStyle(fontSize: 16)),
                    subtitle: Text('로그인 설정을 변경합니다.'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(thickness: 0.5),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('결제 설정', style: TextStyle(fontSize: 16)),
                    subtitle: Text('결제 설정을 변경합니다.'),
                    trailing: Icon(Icons.chevron_right),
                  )
                ],
              ),
            ),
            Dividers.section,
            Padding(
              padding: const EdgeInsets.all(Gaps.size2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('알림동의',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('혜택 알림 동의'),
                    subtitle: const Text('호두 포인트에서 제공하는 다양한 혜택 알림을 받습니다.'),
                    trailing: Switch(
                      value: chacked,
                      onChanged: (value) {
                        setState(() {
                          chacked = !chacked;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        )
      ],
    ));
  }
}
