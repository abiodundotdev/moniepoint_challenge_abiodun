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
}
