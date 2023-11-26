import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/presentation/presentation.dart';

import '../../helper.dart';

void main() {
  late Widget homePage;

  setUp(() {
    TestHelper.setUpServiceContainer();
    homePage = buildTestableMaterialApp(const HomePage());
  });

  group(
    "Homepage test",
    () {
      testWidgets(
        'Verify has app bar',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(
            find.byKey(AppWidgetKeys.appBar),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Verify has bottom nav bar',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(
            find.byKey(AppWidgetKeys.bottomNavBar),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Verify has tracking and avilable vehicles widget',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(
            find.byKey(AppWidgetKeys.homeTrackingWidget),
            findsOneWidget,
          );
          expect(
            find.byKey(AppWidgetKeys.homeAvailableVehiclesWidget),
            findsOneWidget,
          );
        },
      );

      // Test for user interactions on the homepage
      // NB: This can be done on a seperate file, doing it here since their is no much interaction
      // NB: This can be moved to integration test to check each interaction

      testWidgets(
        'Verify navigates to search page on textfield tap',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pumpAndSettle();
          final textField = find.byType(TextFormField);
          expect(textField, findsOneWidget);
          //Tap the button since it is found
          await widgetTester.tap(textField);
          //Wait for some seconds incase of delayed response
          await widgetTester.pumpAndSettle(const Duration(seconds: 2));
          expect(find.byType(SearchPage), findsOneWidget);
        },
      );

      testWidgets(
        'Verify does not navigate when home button is tapped',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pumpAndSettle();
          final homeButton = find.text("Home");
          expect(homeButton, findsOneWidget);
          //Tap the button since it is found
          await widgetTester.tap(homeButton);
          //Wait for some seconds incase of delayed response
          await widgetTester.pumpAndSettle(const Duration(seconds: 2));
          expect(find.byType(HomePage), findsOneWidget);
        },
      );

      testWidgets(
        'Verify navigates to calculator page on calculate button tap',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pumpAndSettle();
          final calculateButton = find.text("Calculate");
          expect(calculateButton, findsOneWidget);
          //Tap the button since it is found
          await widgetTester.tap(calculateButton);
          //Wait for some seconds incase of delayed response
          await widgetTester.pumpAndSettle(const Duration(seconds: 2));
          expect(find.byType(CalculatePage), findsOneWidget);
        },
      );

      // testWidgets(
      //   'Verify navigates to shipment page on shipment button tap',
      //   (WidgetTester widgetTester) async {
      //     await widgetTester.pumpWidget(homePage);
      //     await widgetTester.pump(const Duration(seconds: 4));
      //     final button = find.text("Shipment");
      //     expect(button, findsOneWidget);
      //     //Tap the button since it is found
      //     await widgetTester.tap(button);
      //     //Wait for some seconds incase of delayed response
      //     await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      //     expect(find.byType(ShipmentHistoryPage), findsOneWidget);
      //   },
      // );

      testWidgets(
        'Verify navigates to profile page on profile button tap',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pumpAndSettle();
          final button = find.text("Profile");
          expect(button, findsOneWidget);
          //Tap the button since it is found
          await widgetTester.tap(button);
          //Wait for some seconds incase of delayed response
          await widgetTester.pumpAndSettle(const Duration(seconds: 2));
          expect(find.byType(SearchPage), findsOneWidget);
        },
      );
    },
  );
}
