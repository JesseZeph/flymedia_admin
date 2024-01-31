// To parse this JSON data, do
//
//     final subscriptionRequest = subscriptionRequestFromJson(jsonString);

import 'dart:convert';

SubscriptionRequest subscriptionRequestFromJson(String str) =>
    SubscriptionRequest.fromJson(json.decode(str));

String subscriptionRequestToJson(SubscriptionRequest data) =>
    json.encode(data.toJson());

class SubscriptionRequest {
  final String subId;
  final String price;
  final String name;
  final String features;

  SubscriptionRequest({
    required this.subId,
    required this.price,
    required this.name,
    required this.features,
  });

  factory SubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      SubscriptionRequest(
        subId: json["sub_id"],
        price: json["price"],
        name: json["name"],
        features: json["features"],
      );

  Map<String, dynamic> toJson() => {
        "sub_id": subId,
        "price": price,
        "name": name,
        "features": features,
      };
}
