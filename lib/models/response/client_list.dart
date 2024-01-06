// To parse this JSON data, do
//
//     final clientListRes = clientListResFromJson(jsonString);

import 'dart:convert';

List<ClientListRes> clientListResFromJson(String str) =>
    List<ClientListRes>.from(
        json.decode(str).map((x) => ClientListRes.fromJson(x)));

String clientListResToJson(List<ClientListRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientListRes {
  final String id;
  final String companyName;
  final String companyHq;
  final String website;
  final String companyEmail;
  final String memberContact;
  final bool isVerified;
  final String userId;

  ClientListRes({
    required this.id,
    required this.companyName,
    required this.companyHq,
    required this.website,
    required this.companyEmail,
    required this.memberContact,
    required this.isVerified,
    required this.userId,
  });

  factory ClientListRes.fromJson(Map<String, dynamic> json) => ClientListRes(
        id: json["_id"],
        companyName: json["companyName"],
        companyHq: json["companyHq"],
        website: json["website"],
        companyEmail: json["companyEmail"],
        memberContact: json["memberContact"],
        isVerified: json["isVerified"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "companyHq": companyHq,
        "website": website,
        "companyEmail": companyEmail,
        "memberContact": memberContact,
        "isVerified": isVerified,
        "userId": userId,
      };
}
