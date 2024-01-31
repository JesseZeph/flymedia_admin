// To parse this JSON data, do
//
//     final subscriptionResponse = subscriptionResponseFromJson(jsonString);

import 'dart:convert';

List<SubscriptionResponse> subscriptionResponseFromJson(String str) =>
    List<SubscriptionResponse>.from(
        json.decode(str).map((x) => SubscriptionResponse.fromJson(x)));

String subscriptionResponseToJson(List<SubscriptionResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubscriptionResponse {
  final String id;
  final String price;
  final String name;
  final String features;
  final String colorCode;

  SubscriptionResponse({
    required this.id,
    required this.price,
    required this.name,
    required this.features,
    required this.colorCode,
  });

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      SubscriptionResponse(
        id: json["_id"],
        price: json["price"],
        name: json["name"],
        features: json["features"],
        colorCode: json["color_code"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "price": price,
        "name": name,
        "features": features,
        "color_code": colorCode,
      };
}
