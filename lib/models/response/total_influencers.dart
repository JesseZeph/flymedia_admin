// To parse this JSON data, do
//
//     final totalInfluencersRes = totalInfluencersResFromJson(jsonString);

import 'dart:convert';

TotalInfluencersRes totalInfluencersResFromJson(String str) =>
    TotalInfluencersRes.fromJson(json.decode(str));

String totalInfluencersResToJson(TotalInfluencersRes data) =>
    json.encode(data.toJson());

class TotalInfluencersRes {
  final int totalInfluencers;

  TotalInfluencersRes({
    required this.totalInfluencers,
  });

  factory TotalInfluencersRes.fromJson(Map<String, dynamic> json) =>
      TotalInfluencersRes(
        totalInfluencers: json["totalInfluencers"],
      );

  Map<String, dynamic> toJson() => {
        "totalInfluencers": totalInfluencers,
      };
}
