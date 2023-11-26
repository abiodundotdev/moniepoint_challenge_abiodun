// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShipmentModel _$$_ShipmentModelFromJson(Map<String, dynamic> json) =>
    _$_ShipmentModel(
      id: json['id'] as int?,
      trackingId: json['tracking_id'] as String?,
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      address: json['address'] as String?,
      status: json['status'] as String?,
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$$_ShipmentModelToJson(_$_ShipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tracking_id': instance.trackingId,
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'address': instance.address,
      'status': instance.status,
      'amount': instance.amount,
    };
