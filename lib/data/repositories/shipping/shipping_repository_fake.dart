import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/domain/domain.dart';

class FakeShippingRepository implements ShippingRepositoryInterface {
  @override
  Future<String> calculate(ShipmentRequestData requestData) async {
    await Future.delayed(const Duration(seconds: 3));
    return "Successful";
  }

  @override
  Future<ShipmentItemList> getShipmentItems() async {
    final response = await loadStringAsMap(AppJsonResponses.shipmentItems);
    return List.from(response['data'])
        .map((e) => ShipmentItemModel.fromJson(e))
        .toList();
  }

  @override
  Future<ShipmentList> getShipments() async {
    final response = await loadStringAsMap(AppJsonResponses.shipments);
    return List.from(response['data'])
        .map((e) => ShipmentModel.fromJson(e))
        .toList();
  }
}
