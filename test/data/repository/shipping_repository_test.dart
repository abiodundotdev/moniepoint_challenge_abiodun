import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint/data/data.dart';
import 'package:moniepoint/domain/domain.dart';

import '../../helper.dart';

void main() {
  late ShippingRepositoryInterface shippingRepository;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestHelper.setUpServiceContainer();
    shippingRepository = FakeShippingRepository();
  });

  group("Test for shipping repository", () {
    test(
      "Verify successfully calculate shipment",
      () async {
        expect(
          await shippingRepository.calculate(ShipmentRequestData()),
          isA<String>(),
        );
      },
    );

    test(
      "Verify successfully get shipments data",
      () async {
        final response = await shippingRepository.getShipments();
        expect(response, isA<ShipmentList>());
        expect(response.length, greaterThan(2));
      },
    );

    test(
      "Verify successfully get shipments item data",
      () async {
        final response = await shippingRepository.getShipmentItems();
        expect(response, isA<ShipmentItemList>());
        expect(response.length, greaterThan(2));
      },
    );
  });
}
