// To parse this JSON data, do
//
//     final totalUsersRes = totalUsersResFromJson(jsonString);

import 'dart:convert';

TotalUsersRes totalUsersResFromJson(String str) =>
    TotalUsersRes.fromJson(json.decode(str));

String totalUsersResToJson(TotalUsersRes data) => json.encode(data.toJson());

class TotalUsersRes {
  final int totalUsers;

  TotalUsersRes({
    required this.totalUsers,
  });

  factory TotalUsersRes.fromJson(Map<String, dynamic> json) => TotalUsersRes(
        totalUsers: json["totalUsers"],
      );

  Map<String, dynamic> toJson() => {
        "totalUsers": totalUsers,
      };
}
