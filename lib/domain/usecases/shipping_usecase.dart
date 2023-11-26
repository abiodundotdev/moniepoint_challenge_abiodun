import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/presentation/presentation.dart';
import 'package:moniepoint/presentation/shipping/shipments_item_bloc/shipments_item_bloc.dart';
import 'package:moniepoint/presentation/shipping/shipmentsbloc/shipments_bloc.dart';
import 'package:moniepoint/service_container.dart';

mixin ShippingUsecases {
  final repository = SC.get.repository;
  Future<void> calculateShipment(
      BuildContext context, ShipmentRequestData requestData) async {
    try {
      AppPreloader.of(context).show(isDismissible: true);
      await repository.shipping.calculate(requestData);
      AppPreloader.of(context).hide();
      SC.get.navigator.dash.toShipmentSuccessful();
      return;
    } catch (e) {
      log(e.toString());
    }
  }

  void fetchShipment(
      FetchShipmentsEvent event, Emitter<ShipmentsState> emit) async {
    emit(const ShipmentsLoadingState());
    try {
      final result = await repository.shipping.getShipments();
      emit(ShipmentsCompletedState(result));
    } catch (error) {
      emit(const ShipmentsErrorState("Error occur"));
    }
  }

  void fetchShipmentItems(
      FetchShipmentsItemEvent event, Emitter<ShipmentsItemState> emit) async {
    emit(const ShipmentsItemLoadingState());
    try {
      final result = await repository.shipping.getShipmentItems();
      emit(ShipmentsItemCompleted(result));
    } catch (e) {
      emit(const ShipmentsItemErrorState("Error occur"));
    }
  }
}
