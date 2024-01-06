// To parse this JSON data, do
//
//     final getInfluencerProfiles = getInfluencerProfilesFromJson(jsonString);

import 'dart:convert';

List<GetInfluencerProfiles> getInfluencerProfilesFromJson(String str) =>
    List<GetInfluencerProfiles>.from(
        json.decode(str).map((x) => GetInfluencerProfiles.fromJson(x)));

String getInfluencerProfilesToJson(List<GetInfluencerProfiles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetInfluencerProfiles {
  final String id;
  final String imageUrl;
  final String firstAndLastName;
  final String location;
  final String tikTokLink;
  final String email;
  final String noOfTikTokFollowers;
  final String noOfTikTokLikes;
  final String postsViews;
  final String bio;
  final String userId;

  GetInfluencerProfiles({
    required this.id,
    required this.imageUrl,
    required this.firstAndLastName,
    required this.location,
    required this.tikTokLink,
    required this.email,
    required this.noOfTikTokFollowers,
    required this.noOfTikTokLikes,
    required this.postsViews,
    required this.bio,
    required this.userId,
  });

  factory GetInfluencerProfiles.fromJson(Map<String, dynamic> json) =>
      GetInfluencerProfiles(
        id: json["_id"],
        imageUrl: json["imageURL"],
        firstAndLastName: json["firstAndLastName"],
        location: json["location"],
        tikTokLink: json["tikTokLink"],
        email: json["email"],
        noOfTikTokFollowers: json["noOfTikTokFollowers"],
        noOfTikTokLikes: json["noOfTikTokLikes"],
        postsViews: json["postsViews"],
        bio: json["bio"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imageURL": imageUrl,
        "firstAndLastName": firstAndLastName,
        "location": location,
        "tikTokLink": tikTokLink,
        "email": email,
        "noOfTikTokFollowers": noOfTikTokFollowers,
        "noOfTikTokLikes": noOfTikTokLikes,
        "postsViews": postsViews,
        "bio": bio,
        "userId": userId,
      };
}
