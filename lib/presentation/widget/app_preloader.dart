import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:moniepoint/core/core.dart';
import 'dart:ui' as ui;

class AppPreloader extends StatefulWidget {
  final Widget child;
  const AppPreloader({super.key, required this.child});

  static _AppPreloaderState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppPreloaderState>()!;
  }

  @override
  State<AppPreloader> createState() => _AppPreloaderState();
}

class _AppPreloaderState extends State<AppPreloader> {
  @override
  Widget build(BuildContext context) {
    return Material(child: widget.child);
  }

  Future<void> show({bool isDismissible = true}) async {
    const settings = RouteSettings(name: "preloader", arguments: "welcomeoo");
    final navigatorContext = rootNavigatorKey.currentState!.context;
    return showDialog(
      context: navigatorContext,
      barrierDismissible: isDismissible,
      barrierColor: Colors.transparent,
      routeSettings: settings,
      builder: (context) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 3.0,
            sigmaY: 3.0,
          ),
          child: Align(
            alignment: Alignment.center,
            child: LottieBuilder.asset(
              AppLotties.van,
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
              width: 105.w,
              animate: true,
            ),
          ),
        );
      },
    );
  }

  Future<void> hide() async {
    Navigator.of(rootNavigatorKey.currentState!.context).pop();
  }
}
