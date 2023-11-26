import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_model.freezed.dart';
part 'shipment_model.g.dart';

@freezed
class ShipmentModel with _$ShipmentModel {
  factory ShipmentModel({
    int? id,
    @JsonKey(name: 'tracking_id') String? trackingId,
    @JsonKey(name: 'delivery_date') DateTime? deliveryDate,
    String? address,
    String? status,
    int? amount,
  }) = _ShipmentModel;

  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);
}
