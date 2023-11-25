import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/core/constants/constants.dart';
import 'package:moniepoint/presentation/presentation.dart';

import '../../helper.dart';

void main() {
  late Widget calculatePage;

  setUp(() {
    TestHelper.setUpServiceContainer();
    calculatePage = buildTestableMaterialApp(const CalculatePage());
  });

  group(
    "Calculate page test",
    () {
      testWidgets(
        'Verify has destination widget',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(calculatePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(find.byKey(AppWidgetKeys.destinationWidget), findsOneWidget);
        },
      );

      testWidgets(
        'Verify has packaging widget',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(calculatePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(find.byKey(AppWidgetKeys.packagingWidget), findsOneWidget);
        },
      );

      testWidgets(
        'Verify has categories widget',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(calculatePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(find.byKey(AppWidgetKeys.categoriesWidget), findsOneWidget);
        },
      );
    },
  );
}
