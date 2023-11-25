import 'package:flutter/material.dart';
import 'package:moniepoint/presentation/dashboard/search_page.dart';

class AppFakeData {
  static List<ShipmentDataModel> shipmentData = [
    ShipmentDataModel(
      package: "Mackbook pro",
      trackingId: "#NEJ78783783778232323",
      senderLocation: "Paris",
      receiverLocation: "Morroco",
    ),
    ShipmentDataModel(
      package: "Summer linen jacket",
      trackingId: "#NEJ7837837837823",
      receiverLocation: "Paris",
      senderLocation: "Barcelona",
    ),
    ShipmentDataModel(
      package: "Tampered-fit jeans AW",
      trackingId: "#NEJ2378327832783",
      receiverLocation: "Paris",
      senderLocation: "Columbia",
    ),
    ShipmentDataModel(
      package: "Slim fit jeans AW",
      trackingId: "#NEJ378327378322",
      receiverLocation: "Dhaka",
      senderLocation: "Bogota",
    ),
    ShipmentDataModel(
      package: "Office setup desk",
      trackingId: "#NEJ3783734783783",
      receiverLocation: "German",
      senderLocation: "France",
    )
  ];

  static List<ShipingModel> shipings = [
    ShipingModel(
      status: ShipingStatus.inProgress,
      amount: 50000,
      date: "Sep 20 2023",
    )
    //   ShipmentDataModel(
    //     package: "Summer linen jacket",
    //     trackingId: "#NEJ7837837837823",
    //     receiverLocation: "Paris",
    //     senderLocation: "Barcelona",
    //   ),
    //   ShipmentDataModel(
    //     package: "Tampered-fit jeans AW",
    //     trackingId: "#NEJ2378327832783",
    //     receiverLocation: "Paris",
    //     senderLocation: "Columbia",
    //   ),
    //   ShipmentDataModel(
    //     package: "Slim fit jeans AW",
    //     trackingId: "#NEJ378327378322",
    //     receiverLocation: "Dhaka",
    //     senderLocation: "Bogota",
    //   ),
    //   ShipmentDataModel(
    //     package: "Office setup desk",
    //     trackingId: "#NEJ3783734783783",
    //     receiverLocation: "German",
    //     senderLocation: "France",
    //   )
  ];
}

class ShipingModel {
  final ShipingStatus status;
  final num amount;
  final String date;

  ShipingModel({
    required this.status,
    required this.amount,
    required this.date,
  });
}

enum ShipingStatus {
  inProgress("in-progress", Color(0XFF3DC429), Icons.cached),
  loading("loading", Colors.blue, Icons.history),
  pending("pending", Color(0xffF17A21), Icons.av_timer);

  final String fullName;
  final IconData icon;
  final Color color;
  const ShipingStatus(this.fullName, this.color, this.icon);
}
