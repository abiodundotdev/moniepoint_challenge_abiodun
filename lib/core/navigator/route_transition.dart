import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class RouteTransition {
  static PageRoute<T> slideIn<T extends Object>(Widget widget,
      {String? name, bool fullscreenDialog = false, RouteSettings? settings}) {
    return Platform.isIOS
        ? CupertinoPageRoute<T>(
            builder: (_) => widget,
            settings: settings,
            maintainState: true,
            fullscreenDialog: fullscreenDialog,
          )
        : MaterialPageRoute(
            builder: (_) => widget,
            settings: settings,
            maintainState: true,
            fullscreenDialog: fullscreenDialog,
          );
  }

  static PageRoute<T> fadeIn<T extends Object>(Widget widget,
      {String? name, bool fullscreenDialog = false}) {
    return PageRouteBuilder<T>(
      opaque: false,
      pageBuilder: (_, __, ___) => widget,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
      settings: name != null ? RouteSettings(name: name) : null,
      maintainState: true,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
