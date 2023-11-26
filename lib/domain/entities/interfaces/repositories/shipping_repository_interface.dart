import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/domain/entities/aliases/models.dart';

abstract class ShippingRepositoryInterface {
  Future<String> calculate(ShipmentRequestData requestData);
  Future<ShipmentList> getShipments();
  Future<ShipmentItemList> getShipmentItems();
}
