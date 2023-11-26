import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/app_state.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/data/data.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/presentation/shipping/shipments_item_bloc/shipments_item_bloc.dart';
import 'package:moniepoint/presentation/shipping/shipmentsbloc/shipments_bloc.dart';
import 'package:moniepoint/service_container.dart';

class TestHelper {
  static void setUpServiceContainer() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SC()
      ..add<AppNavigator>(AppNavigator(rootNavigatorKey))
      ..add<SessionStorage>(SessionStorage())
      ..add<Repository>(Repository(
        shipping: FakeShippingRepository(),
      ));
  }

  static void populateState(BuildContext context) {
    ShipmentsStateProvider.fetch(context);
    ShipmentsItemStateProvider.fetch(context);
  }
}

Widget buildTestableMaterialApp(Widget widget) {
  return AppPreloader(
    child: AppTheme(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, _) {
          return AppStateProvider(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MONIEPOINT TEST',
              theme: AppTheme.of(context).light(Theme.of(context)),
              darkTheme: AppTheme.of(context).dark(Theme.of(context)),
              navigatorKey: rootNavigatorKey,
              home: widget,
            ),
          );
        },
      ),
    ),
  );
}
