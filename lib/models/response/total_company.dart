// To parse this JSON data, do
//
//     final totalCompaniesRes = totalCompaniesResFromJson(jsonString);

import 'dart:convert';

TotalCompaniesRes totalCompaniesResFromJson(String str) =>
    TotalCompaniesRes.fromJson(json.decode(str));

String totalCompaniesResToJson(TotalCompaniesRes data) =>
    json.encode(data.toJson());

class TotalCompaniesRes {
  final int totalCompanies;

  TotalCompaniesRes({
    required this.totalCompanies,
  });

  factory TotalCompaniesRes.fromJson(Map<String, dynamic> json) =>
      TotalCompaniesRes(
        totalCompanies: json["totalCompanies"],
      );

  Map<String, dynamic> toJson() => {
        "totalCompanies": totalCompanies,
      };
}
