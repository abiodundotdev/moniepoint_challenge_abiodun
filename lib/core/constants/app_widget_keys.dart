import 'package:flutter/material.dart';

///Widget keys to identify each widget mostly used when testing,
///Or used to search for a widget on the widget tree
class AppWidgetKeys {
  AppWidgetKeys._();
  static Key appBar = const Key("app_bar");
  static Key bottomNavBar = const Key("bottom_nav_bar");
  static Key homeTrackingWidget = const Key("tracking");
  static Key homeAvailableVehiclesWidget = const Key("availabe_vehicles");
  static Key scrollable = const Key("scrollable");

  ///Calculate Page Keys
  static Key destinationWidget = const Key("destination");
  static Key packagingWidget = const Key("packaging");
  static Key categoriesWidget = const Key("categories");
}
