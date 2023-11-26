// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShipmentItemModel _$$_ShipmentItemModelFromJson(Map<String, dynamic> json) =>
    _$_ShipmentItemModel(
      package: json['package'] as String?,
      trackingId: json['trackingId'] as String?,
      senderLocation: json['senderLocation'] as String?,
      receiverLocation: json['receiverLocation'] as String?,
    );

Map<String, dynamic> _$$_ShipmentItemModelToJson(
        _$_ShipmentItemModel instance) =>
    <String, dynamic>{
      'package': instance.package,
      'trackingId': instance.trackingId,
      'senderLocation': instance.senderLocation,
      'receiverLocation': instance.receiverLocation,
    };
