import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hodoo_point/constants/colors.dart';
import 'package:hodoo_point/features/authentication/repos/authentication_repo.dart';
import 'package:hodoo_point/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(DevicePreview(
      enabled: kIsWeb,
      builder: (context) =>
          const ProviderScope(child: App()))); // Wrap your app
}

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(authRepo.notifier).signIn();
    });
    if (ref.watch(authRepo)) {
      return MaterialApp.router(
        //web 에서 page view 사용시 스크롤이 안되는 문제 해결
        scrollBehavior: AppScrollBehavior(),
        routerConfig: ref.watch(routerProvider),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
      );
    } else {
      return Material(
        color: const Color(0xff0071b7),
        child: Image.asset('assets/images/hodoo.jpg'),
      );
    }
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
