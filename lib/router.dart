import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/features/authentication/views/sign_up_screen.dart';
import 'package:hodoo_point/features/home/views/home_screen.dart';
import 'package:hodoo_point/features/my_page/my_page_screen.dart';
import 'package:hodoo_point/features/notice/views/notice_detail_screen.dart';
import 'package:hodoo_point/features/notice/views/notice_screen.dart';
import 'package:hodoo_point/features/payment/views/payment_screen.dart';
import 'package:hodoo_point/features/root/root_scaffold.dart';
import 'package:hodoo_point/features/authentication/views/login_screen.dart';
import 'package:hodoo_point/features/setting/setting_screen.dart';
import 'package:hodoo_point/features/menu/views/menu_screen.dart';
import 'package:hodoo_point/features/notifications/notifications_screen.dart';
import 'package:hodoo_point/features/shopping/views/shopping_invalid_product_screen.dart';
import 'package:hodoo_point/features/shopping/views/shopping_product_screen.dart';
import 'package:hodoo_point/features/shopping/views/shopping_screen.dart';
import 'package:hodoo_point/utils/root_navigation.dart';

final routerProvider = Provider((ref) {
//  ref.watch(authState);
  return GoRouter(
    navigatorKey: RootNavigation.navigatorKey,
    initialLocation: HomeScreen.routePath,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return RootScaffold(navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: HomeScreen.routePath,
                  builder: (context, state) => const HomeScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: ShoppingScreen.routePath,
                  builder: (context, state) => const ShoppingScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: PaymentScreen.routePath,
                  builder: (context, state) => const PaymentScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: MyPageScreen.routePath,
                  builder: (context, state) => const MyPageScreen(),
                ),
              ],
            ),
          ]),
      GoRoute(
          parentNavigatorKey: RootNavigation.navigatorKey,
          path: LoginScreen.routePath,
          builder: (context, state) => const LoginScreen()),
      GoRoute(
          parentNavigatorKey: RootNavigation.navigatorKey,
          path: SignUpScreen.routePath,
          builder: (context, state) => const SignUpScreen()),
      GoRoute(
          parentNavigatorKey: RootNavigation.navigatorKey,
          path: NoticeScreen.routePath,
          builder: (context, state) => const NoticeScreen()),
      GoRoute(
          parentNavigatorKey: RootNavigation.navigatorKey,
          path: SettingScreen.routePath,
          builder: (context, state) => const SettingScreen()),
      GoRoute(
          parentNavigatorKey: RootNavigation.navigatorKey,
          path: NoticeDetailScreen.routePath,
          builder: (context, state) => NoticeDetailScreen(
              noticeId: int.tryParse(state.pathParameters['noticeId'] ?? ''))),
      GoRoute(
          parentNavigatorKey: RootNavigation.navigatorKey,
          path: ShoppingProductScreen.routePath,
          builder: (context, state) {
            final int? productId =
                int.tryParse(state.pathParameters['productId'] ?? '');

            if (productId == null) return const ShoppingInvalidProductScreen();

            return ShoppingProductScreen(productId: productId);
          }),
      GoRoute(
        parentNavigatorKey: RootNavigation.navigatorKey,
        path: NotificationScreen.routePath,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          barrierColor: Colors.black.withOpacity(0.08),
          key: state.pageKey,
          child: const NotificationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeIn)),
                  ),
                  child: child),
        ),
      ),
      GoRoute(
        parentNavigatorKey: RootNavigation.navigatorKey,
        path: MenuScreen.routePath,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          barrierColor: Colors.black.withOpacity(0.08),
          key: state.pageKey,
          child: const MenuScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeIn)),
                  ),
                  child: child),
        ),
      ),
    ],
  );
});
