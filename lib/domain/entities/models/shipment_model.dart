import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moniepoint/core/core.dart';

part 'shipment_model.freezed.dart';
part 'shipment_model.g.dart';

@freezed
class ShipmentModel with _$ShipmentModel {
  const ShipmentModel._();
  factory ShipmentModel({
    int? id,
    @JsonKey(name: 'tracking_id') String? trackingId,
    @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
    String? address,
    String? status,
    int? amount,
  }) = _ShipmentModel;

  ShipingStatus get statusToEnum {
    switch (status) {
      case "in-progress":
        return ShipingStatus.inProgress;
      case "loading":
        return ShipingStatus.loading;
      default:
        return ShipingStatus.pending;
    }
  }

  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);
}
