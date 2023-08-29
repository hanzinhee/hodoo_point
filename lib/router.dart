import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hodoo_point/app_scaffold.dart';
import 'package:hodoo_point/features/authentication/repos/authentication_repo.dart';
import 'package:hodoo_point/features/home/home_screen.dart';
import 'package:hodoo_point/services/navigation_service.dart';

final routerProvider = Provider((ref) {
//  ref.watch(authState);
  return GoRouter(
    navigatorKey: NavigationService.rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
    },
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AppScaffold(navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: NavigationService.sectionNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomeScreen(),
                ),
              ],
            ),
          ])
    ],
  );
});
