// To parse this JSON data, do
//
//     final pendingVerificationRes = pendingVerificationResFromJson(jsonString);

import 'dart:convert';

List<PendingVerificationRes> pendingVerificationResFromJson(String str) =>
    List<PendingVerificationRes>.from(
        json.decode(str).map((x) => PendingVerificationRes.fromJson(x)));

String pendingVerificationResToJson(List<PendingVerificationRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingVerificationRes {
  final String id;
  final String companyName;
  final String companyHq;
  final String website;
  final String companyEmail;
  final String memberContact;
  final bool isVerified;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PendingVerificationRes({
    required this.id,
    required this.companyName,
    required this.companyHq,
    required this.website,
    required this.companyEmail,
    required this.memberContact,
    required this.isVerified,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PendingVerificationRes.fromJson(Map<String, dynamic> json) =>
      PendingVerificationRes(
        id: json["_id"],
        companyName: json["companyName"],
        companyHq: json["companyHq"],
        website: json["website"],
        companyEmail: json["companyEmail"],
        memberContact: json["memberContact"],
        isVerified: json["isVerified"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
