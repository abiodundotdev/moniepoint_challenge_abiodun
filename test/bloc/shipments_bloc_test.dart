import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/presentation/shipping/shipmentsbloc/shipments_bloc.dart';

import '../helper.dart';

void main() {
  late ShipmentsStateProvider shipmentsBloc;
  setUpAll(() {
    TestHelper.setUpServiceContainer();
  });

  setUp(() {
    shipmentsBloc = ShipmentsStateProvider();
  });

  tearDownAll(() {
    shipmentsBloc.close();
  });

  group("Test for Shipments BLoC for different events", () {
    test(
      "Verify initial state is loading",
      () {
        expect(
          shipmentsBloc.state,
          isA<ShipmentsLoadingState>(),
        );
      },
    );

    blocTest(
      "Verify fetch transactions emits a completed state",
      build: () => shipmentsBloc,
      act: (ShipmentsStateProvider bloc) =>
          bloc.add(const FetchShipmentsEvent()),
      expect: () =>
          [isA<ShipmentsLoadingState>(), isA<ShipmentsCompletedState>()],
    );
  });
}
