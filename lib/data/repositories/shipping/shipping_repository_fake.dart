import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/domain/entities/aliases/models.dart';

class FakeShippingRepository implements ShippingRepositoryInterface {
  @override
  Future<String> calculate(ShipmentRequestData requestData) async {
    await Future.delayed(const Duration(seconds: 3));
    return "Successful";
  }

  @override
  Future<ShipmentItemList> getShipmentItems() async {
    return [];
  }

  @override
  Future<ShipmentList> getShipments() async {
    return [];
  }
}
