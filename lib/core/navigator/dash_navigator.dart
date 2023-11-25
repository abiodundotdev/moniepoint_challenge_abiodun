import 'package:flutter/material.dart';
import 'package:moniepoint/presentation/presentation.dart';

import 'base_navigator.dart';

class DashNavigator extends BaseNavigator {
  DashNavigator(GlobalKey<NavigatorState> navigatorkey) : super(navigatorkey);
  void toLogin() {
    pushAndRemoveAllExceptThis(
      const Text(""),
    );
  }

  void toDashboard() {
    pushAndRemoveAllExceptThis(
      const DashboardPage(),
    );
  }

  void toHome() {
    pushAndRemoveAllExceptThis(
      const HomePage(),
    );
  }

  void toShipmentSuccessful() {
    push(const ShipmentSuccessful());
  }

  void toSearchPage() {
    push(const SearchPage());
  }

  void toCalculate() {
    push(const CalculatePage());
  }

  void toShipmentHistory() {
    push(const ShipmentHistoryPage());
  }
}
