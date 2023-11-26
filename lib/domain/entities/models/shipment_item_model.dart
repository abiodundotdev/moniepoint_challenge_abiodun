import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_item_model.freezed.dart';
part 'shipment_item_model.g.dart';

@freezed
class ShipmentItemModel with _$ShipmentItemModel {
  factory ShipmentItemModel({
    String? package,
    String? trackingId,
    String? senderLocation,
    String? receiverLocation,
  }) = _ShipmentItemModel;

  factory ShipmentItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentItemModelFromJson(json);
}
