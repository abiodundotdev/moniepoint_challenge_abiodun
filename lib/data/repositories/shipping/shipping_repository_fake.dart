import 'package:moniepoint/domain/domain.dart';

class FakeShippingRepository implements ShippingRepositoryInterface {
  @override
  Future<String> calculate(ShipmentRequestData requestData) async {
    return "Successful";
  }
}
