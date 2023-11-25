import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/service_container.dart';

class TestHelper {
  static void setUpServiceContainer() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SC()
      ..add<AppNavigator>(AppNavigator(rootNavigatorKey))
      ..add<SessionStorage>(SessionStorage());
  }
}

Widget buildTestableMaterialApp(Widget widget) {
  return AppTheme(
    child: ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MONIEPOINT TEST',
          theme: AppTheme.of(context).light(Theme.of(context)),
          darkTheme: AppTheme.of(context).dark(Theme.of(context)),
          navigatorKey: rootNavigatorKey,
          home: widget,
        );
      },
    ),
  );
}
