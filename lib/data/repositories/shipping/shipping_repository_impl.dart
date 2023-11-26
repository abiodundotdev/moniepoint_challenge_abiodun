import 'package:moniepoint/core/core.dart';
import 'package:moniepoint/domain/domain.dart';

class ShippingRepositoryImpl implements ShippingRepositoryInterface {
  final AppHttpClient httpClient;
  ShippingRepositoryImpl(this.httpClient);
  @override
  Future<String> calculate(ShipmentRequestData requestData) async {
    await Future.delayed(const Duration(seconds: 2));
    return "Successfull";
  }

  @override
  Future<ShipmentItemList> getShipmentItems() async {
    final response = await httpClient.get(Endpoints.shipping.shipmentData);
    return List.from(response.data['data'])
        .map((e) => ShipmentItemModel.fromJson(e))
        .toList();
  }

  @override
  Future<ShipmentList> getShipments() async {
    final response = await httpClient.get(Endpoints.shipping.shipments);
    return List.from(response.data['data'])
        .map((e) => ShipmentModel.fromJson(e))
        .toList();
  }
}
