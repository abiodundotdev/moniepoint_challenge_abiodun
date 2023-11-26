class ShipmentRequestData {
  ShipmentRequestData();
  String? senderLocation;
  String? recieverLocation;
  String? weight;
  String? package;
  String? category;

  Map<String, dynamic> toMap() {
    return {
      'sender_location': senderLocation,
      'reciever_location': recieverLocation,
      'weight': weight,
      'package': weight,
      'category': weight,
    };
  }

  @override
  String toString() {
    return "ShipmentRequestData(senderLocation : $senderLocation, recieverLocation : $recieverLocation, weight : $weight)";
  }
}
