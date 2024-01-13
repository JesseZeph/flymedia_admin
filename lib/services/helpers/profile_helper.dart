import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/get_influencer_profile.dart';
import 'package:flymedia_admin/services/config.dart';
import 'package:http/http.dart' as http;
import "package:http/http.dart" as https;

class ProfileHelper {
  static var client = https.Client();

  Future<List<GetInfluencerProfiles>> getUserProfile() async {
    List<GetInfluencerProfiles> profile = [];

    try {
      final response = await http
          .get(Uri.https(Config.apiUrl, Config.influencerProfile),
              headers: await getHeaders())
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () => http.Response('Network Timeout', 504),
          );
      if (response.statusCode == 200) {
        profile = getInfluencerProfilesFromJson(response.body);
      }
    } catch (e, s) {
      debugPrint("====> error in getting profile : ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }

    return profile;
  }

  Future<Map<String, String>> getHeaders() async {
    return {'Content-Type': 'application/json'};
  }
}
