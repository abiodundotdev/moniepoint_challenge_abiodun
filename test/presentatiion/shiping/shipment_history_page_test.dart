import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/core/constants/constants.dart';
import 'package:moniepoint/presentation/presentation.dart';

import '../../helper.dart';

void main() {
  late Widget shipmentHistoryPage;

  setUp(() {
    TestHelper.setUpServiceContainer();
    shipmentHistoryPage = buildTestableMaterialApp(const ShipmentHistoryPage());
  });

  group(
    "Shipment history page test",
    () {
      testWidgets(
        'Verify has appbar',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(shipmentHistoryPage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(
            find.byKey(AppWidgetKeys.appBar),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Verify has shipments title',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(shipmentHistoryPage);
          await widgetTester.pumpAndSettle();
          final shipments = find.text("Shipments");
          expect(shipments, findsAtLeastNWidgets(1));
        },
      );

      testWidgets(
        'Verify has at least one inprogress and pending shipment',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(shipmentHistoryPage);
          await widgetTester.pumpAndSettle();
          final inProgress = find.text("in-progress");
          final pending = find.text("pending");
          expect(inProgress, findsAtLeastNWidgets(1));
          expect(pending, findsAtLeastNWidgets(1));
        },
      );
    },
  );
}
