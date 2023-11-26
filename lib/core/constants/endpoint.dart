class Endpoints {
  Endpoints._();
  static Shipping shipping = Shipping();
  static const String baseUrl =
      "https://api.mockfly.dev/mocks/f093e772-faf0-4595-8b38-7959c7b48235";
  static String baseUrlDev = "";
  static String baseDUrlStaging = "";
}

class Shipping {
  String shipments = "/shipments";
  String shipmentData = "/shipment-data";
}
