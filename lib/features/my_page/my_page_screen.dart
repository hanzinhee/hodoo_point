import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/constants/gaps.dart';
import 'package:hodoo_point/constants/section_divider.dart';
import 'package:hodoo_point/features/authentication/states/auth_notifier.dart';
import 'package:hodoo_point/features/authentication/views/login_screen.dart';
import 'package:hodoo_point/features/root/widgets/root_app_bar.dart';
import 'package:hodoo_point/utils/unicons.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});
  static String routePath = '/my_page';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = ref.watch(authProvider);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const RootAppBar(),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.symmetric(horizontal: Gaps.size2),
                  leading: Unicons.svg('fi-rr-heart'),
                  title: Text('관심목록', style: TextStyle(fontSize: 16)),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.symmetric(horizontal: Gaps.size2),
                  leading: Unicons.svg('fi-rr-receipt'),
                  title: Text('구매내역', style: TextStyle(fontSize: 16)),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.symmetric(horizontal: Gaps.size2),
                  leading: Unicons.svg('fi-rr-ticket'),
                  title: Text('내 쿠폰', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ]),
        )
      ],
    ));
  }
}
