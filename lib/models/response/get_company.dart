// To parse this JSON data, do
//
//     final getCompanyRes = getCompanyResFromJson(jsonString);

import 'dart:convert';

GetCompanyRes getCompanyResFromJson(String str) =>
    GetCompanyRes.fromJson(json.decode(str));

String getCompanyResToJson(GetCompanyRes data) => json.encode(data.toJson());

class GetCompanyRes {
  final String id;
  final String companyName;
  final String companyHq;
  final String website;
  final String companyEmail;
  final String memberContact;
  final bool isVerified;
  final String userId;

  GetCompanyRes({
    required this.id,
    required this.companyName,
    required this.companyHq,
    required this.website,
    required this.companyEmail,
    required this.memberContact,
    required this.isVerified,
    required this.userId,
  });

  factory GetCompanyRes.fromJson(Map<String, dynamic> json) => GetCompanyRes(
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
