import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/presentation/shipping/shipping.dart';

import '../../helper.dart';

void main() {
  late Widget shipmentSuccessfulPage;

  setUp(() {
    TestHelper.setUpServiceContainer();
    shipmentSuccessfulPage =
        buildTestableMaterialApp(const ShipmentSuccessful());
  });

  group(
    "Search page test",
    () {
      testWidgets(
        'Verify has the 2 images (Logo and Box)',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(shipmentSuccessfulPage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(
            find.byType(Image),
            findsNWidgets(2),
          );
        },
      );

      // testWidgets(
      //   'Verify has Total estimate amout widget and amount widget)',
      //   (WidgetTester widgetTester) async {
      //     await widgetTester.pumpWidget(shipmentSuccessfulPage);
      //     await widgetTester.pump(const Duration(seconds: 4));
      //     expect(find.text("Back"), findsOneWidget);
      //     expect(find.text("USD"), findsOneWidget);
      //   },
      // );
    },
  );
}
