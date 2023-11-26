import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moniepoint/domain/entities/aliases/models.dart';
import 'package:moniepoint/presentation/shipping/shipmentsbloc/shipments_bloc.dart';

class ShipmentsStateBuilder extends StatelessWidget {
  final Widget Function(ShipmentList) builder;
  final Widget Function()? loading;

  const ShipmentsStateBuilder({Key? key, required this.builder, this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentsStateProvider, ShipmentsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          error: (e) => Center(
            child: Column(
              children: [
                Text(
                  e,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
                TextButton(
                    onPressed: () {}, child: const Text("Tap here to retry"))
              ],
            ),
          ),
          loading: () {
            if (loading != null) {
              return loading!();
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            );
          },
          completed: (user) => builder(user),
        );
      },
    );
  }
}
