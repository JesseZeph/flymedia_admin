// To parse this JSON data, do
//
//     final influencerverificationRes = influencerverificationResFromJson(jsonString);

// List<InfluencerverificationRes> influencerverificationResFromJson(String str) =>
//     List<InfluencerverificationRes>.from(
//         json.decode(str).map((x) => InfluencerverificationRes.fromMap(x)));

// String influencerverificationResToJson(List<InfluencerverificationRes> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class InfluencerverificationRes {
  final String id;
  final Influencer influencer;
  final String scanUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  InfluencerverificationRes({
    required this.id,
    required this.influencer,
    required this.scanUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InfluencerverificationRes.fromMap(Map<String, dynamic> json) =>
      InfluencerverificationRes(
        id: json["_id"],
        influencer: Influencer.fromMap(json["influencer"]),
        scanUrl: json["scanUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "_id": id,
  //       "influencer": influencer.toMap(),
  //       "scanUrl": scanUrl,
  //       "createdAt": createdAt.toIso8601String(),
  //       "updatedAt": updatedAt.toIso8601String(),
  //     };

  @override
  String toString() {
    return 'InfluencerverificationRes(id: $id, influencer: $influencer, scanUrl: $scanUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class Influencer {
  final String id;
  final String imageUrl;
  final String firstAndLastName;
  final String location;
  final String email;
  final String tikTokLink;
  final String noOfTikTokFollowers;
  final String noOfTikTokLikes;
  final String postsViews;
  final List<String> niches;
  final String bio;
  final String userId;
  final String verificationImage;
  final String verificationStatus;

  Influencer({
    required this.id,
    required this.imageUrl,
    required this.firstAndLastName,
    required this.location,
    required this.email,
    required this.tikTokLink,
    required this.noOfTikTokFollowers,
    required this.noOfTikTokLikes,
    required this.postsViews,
    required this.niches,
    required this.bio,
    required this.userId,
    required this.verificationImage,
    required this.verificationStatus,
  });

  factory Influencer.fromMap(Map<String, dynamic> json) => Influencer(
        id: json["_id"],
        imageUrl: json["imageURL"],
        firstAndLastName: json["firstAndLastName"],
        location: json["location"],
        email: json["email"],
        tikTokLink: json["tikTokLink"],
        noOfTikTokFollowers: json["noOfTikTokFollowers"],
        noOfTikTokLikes: json["noOfTikTokLikes"],
        postsViews: json["postsViews"],
        niches: List<String>.from(json["niches"].map((x) => x)),
        bio: json["bio"],
        userId: json["userId"],
        verificationImage: json["verificationImage"],
        verificationStatus: json["verificationStatus"],
      );

  // Map<String, dynamic> toMap() => {
  //       "_id": id,
  //       "imageURL": imageUrl,
  //       "firstAndLastName": firstAndLastName,
  //       "location": location,
  //       "email": email,
  //       "tikTokLink": tikTokLink,
  //       "noOfTikTokFollowers": noOfTikTokFollowers,
  //       "noOfTikTokLikes": noOfTikTokLikes,
  //       "postsViews": postsViews,
  //       "niches": List<dynamic>.from(niches.map((x) => x)),
  //       "bio": bio,
  //       "userId": userId,
  //       "verificationImage": verificationImage,
  //       "verificationStatus": verificationStatus,
  //     };

  @override
  String toString() {
    return 'Influencer(id: $id, imageUrl: $imageUrl, firstAndLastName: $firstAndLastName, location: $location, email: $email, tikTokLink: $tikTokLink, noOfTikTokFollowers: $noOfTikTokFollowers, noOfTikTokLikes: $noOfTikTokLikes, postsViews: $postsViews, niches: $niches, bio: $bio, userId: $userId, verificationImage: $verificationImage, verificationStatus: $verificationStatus)';
  }
}
