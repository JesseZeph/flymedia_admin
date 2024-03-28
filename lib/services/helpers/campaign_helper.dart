import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/campaign_res.dart';
import 'package:flymedia_admin/services/config.dart';
import 'package:http/http.dart' as https;

class CampaignHelper {
  static var client = https.Client();

  static Future<List<CampaignUploadResponse>> getCampaigns(
      int pageNumber) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };
      List<CampaignUploadResponse> resp = [];
      var url = Uri.https(AppConfig.apiUrl, AppConfig.getAllCampaigns,
          {'page': pageNumber.toString()});

      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        resp = campaignResponseFromJson(response.body);
        return resp;
      } else {
        // throw Exception('Failed to load campaign');
        return resp;
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return [];
    }
  }
}
