import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/presentation/shipping/shipments_item_bloc/shipments_item_bloc.dart';

import '../helper.dart';

void main() {
  late ShipmentsItemStateProvider shipmentsItemBloc;
  setUpAll(() {
    TestHelper.setUpServiceContainer();
  });

  setUp(() {
    shipmentsItemBloc = ShipmentsItemStateProvider();
  });

  tearDownAll(() {
    shipmentsItemBloc.close();
  });

  group("Test for ShipmentsItems BLoC for different events", () {
    test(
      "Verify initial state is loading",
      () {
        expect(
          shipmentsItemBloc.state,
          isA<ShipmentsItemLoadingState>(),
        );
      },
    );

    blocTest(
      "Verify fetchshipmentsitem event emits a completed state",
      build: () => shipmentsItemBloc,
      act: (ShipmentsItemStateProvider bloc) =>
          bloc.add(const FetchShipmentsItemEvent()),
      expect: () =>
          [isA<ShipmentsItemLoadingState>(), isA<ShipmentsItemCompleted>()],
    );
  });
}
