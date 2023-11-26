import 'package:flutter/material.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/service_container.dart';

mixin ShippingUsecases {
  Future<void> calculateShipment(
      BuildContext context, ShipmentRequestData requestData) async {
    try {
      AppPreloader.of(context).show(isDismissible: true);
      SC.get.navigator.dash.toShipmentSuccessful();
      return;
    } catch (e) {}
  }
}
