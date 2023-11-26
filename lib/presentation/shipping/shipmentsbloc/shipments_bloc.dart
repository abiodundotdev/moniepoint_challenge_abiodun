import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moniepoint/domain/domain.dart';

part 'shipments_state.dart';
part 'shipments_event.dart';
part 'shipments_bloc.freezed.dart';

class ShipmentsStateProvider extends Bloc<ShipmentsEvent, ShipmentsState>
    with ShippingUsecases {
  ShipmentsStateProvider() : super(const ShipmentsState.loading()) {
    on<FetchShipmentsEvent>(fetchShipment);
  }

  static Future<void> fetch(BuildContext context) async {
    BlocProvider.of<ShipmentsStateProvider>(context, listen: false).add(
      const FetchShipmentsEvent(),
    );
  }
}
