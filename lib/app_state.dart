import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moniepoint/presentation/shipping/shipments_item_bloc/shipments_item_bloc.dart';
import 'package:moniepoint/presentation/shipping/shipmentsbloc/shipments_bloc.dart';

class AppStateProvider extends StatelessWidget {
  final Widget child;
  const AppStateProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShipmentsStateProvider>(
          create: (BuildContext context) => ShipmentsStateProvider(),
        ),
        BlocProvider<ShipmentsItemStateProvider>(
          create: (BuildContext context) => ShipmentsItemStateProvider(),
        )
      ],
      child: child,
    );
  }
}

class AppScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
