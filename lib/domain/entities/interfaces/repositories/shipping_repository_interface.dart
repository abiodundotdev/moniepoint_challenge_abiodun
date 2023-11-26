import 'package:moniepoint/domain/domain.dart';

abstract class ShippingRepositoryInterface {
  Future<String> calculate(ShipmentRequestData requestData);
}
