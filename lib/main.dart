import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/splash_screen.dart';
import 'package:moniepoint/service_container.dart';

void main() async {
  await SC.initialize();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: SC.get.sessionStorage.appAnimationDuration,
      builder: (context, _, __) {
        return AppTheme(
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            builder: (context, child) {
              return ValueListenableBuilder(
                valueListenable: SC.get.sessionStorage.appThemeMode,
                builder: (context, themeMode, __) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode: themeMode,
                    navigatorObservers: [routeObserver],
                    navigatorKey: rootNavigatorKey,
                    theme: AppTheme.of(context).light(context.theme),
                    darkTheme: AppTheme.of(context).dark(context.theme),
                    home: const SplashScreen(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
