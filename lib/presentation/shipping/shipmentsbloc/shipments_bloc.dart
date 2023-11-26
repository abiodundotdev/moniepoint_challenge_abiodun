import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moniepoint/domain/domain.dart';
import 'package:moniepoint/domain/entities/aliases/models.dart';

part 'shipments_state.dart';
part 'shipments_event.dart';
part 'shipments_bloc.freezed.dart';

class ShipmentsStateProvider extends Bloc<ShipmentsEvent, ShipmentsState>
    with ShippingUsecases {
  ShipmentsStateProvider() : super(const ShipmentsState.loading()) {
    on<FetchShipmentsEvent>(fetchShipment);
  }
}
