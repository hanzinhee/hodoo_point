import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/common/widgets/hodoo_sliver_app_bar.dart';
import 'package:hodoo_point/features/authentication/states/auth_notifier.dart';
import 'package:hodoo_point/features/authentication/views/login_screen.dart';

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
    final members = ref.watch(authProvider);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        HodooSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Gaps.size2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (ref.watch(isLoggedIn)) ...[
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(members!.name!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      subtitle: Text('계정유형  ${members.loginKind.name}'),
                      trailing: OutlinedButton(
                        onPressed: () {},
                        child: const Text('회원정보 변경'),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              ref.read(authProvider.notifier).signOut();
                              context.go('/home');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.grey,
                            ),
                            child: const Text('로그아웃')))
                  ] else
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('로그인 해주세요.',
                          style: TextStyle(fontSize: 16)),
                      trailing: FilledButton(
                        onPressed: () {
                          context.push(LoginScreen.routePath);
                        },
                        child: const Text('로그인'),
                      ),
                    ),
                ],
              ),
            ),
            Dividers.section,
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
