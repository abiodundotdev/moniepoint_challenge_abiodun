import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/presentation/dashboard/search_page.dart';

import '../../helper.dart';

void main() {
  late Widget homePage;

  setUp(() {
    TestHelper.setUpServiceContainer();
    homePage = buildTestableMaterialApp(const SearchPage());
  });

  group(
    "Search page test",
    () {
      testWidgets(
        'Verify has search form field',
        (WidgetTester widgetTester) async {
          await widgetTester.pumpWidget(homePage);
          await widgetTester.pump(const Duration(seconds: 2));
          expect(
            find.byType(TextFormField),
            findsOneWidget,
          );
        },
      );
    },
  );
}
