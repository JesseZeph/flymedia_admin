import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/subscription_response.dart';
import 'package:flymedia_admin/services/config.dart';
import 'package:http/http.dart' as http;
import "package:http/http.dart" as https;
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionHelper {
  static var client = https.Client();

  Future<List<SubscriptionResponse>> getAllSubscriptions() async {
    List<SubscriptionResponse> subscription = [];

    try {
      final response = await http
          .get(Uri.https(AppConfig.apiUrl, AppConfig.subscriptionUrl),
              headers: await getHeaders())
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () => http.Response('Network Timeout', 504),
          );
      if (response.statusCode == 200) {
        subscription = subscriptionResponseFromJson(response.body);
      }
    } catch (e, s) {
      debugPrint("====> error in getting profile : ${e.toString()}");
      debugPrintStack(stackTrace: s);
    }

    return subscription;
  }

  static Future<bool> editSubscription(String model) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        return false;
      }

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token',
      };

      var url = Uri.https(AppConfig.apiUrl, AppConfig.subscriptionUrl);

      var response =
          await client.put(url, headers: requestHeaders, body: model);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteSubscription() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        return false;
      }

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token',
      };

      var url = Uri.https(AppConfig.apiUrl, AppConfig.subscriptionUrl);

      var response = await client.delete(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      debugPrint("===> error deleting subscription : ${e.toString()}");
      debugPrintStack(stackTrace: s);
      return false;
    }
  }

  Future<Map<String, String>> getHeaders() async {
    return {'Content-Type': 'application/json'};
  }
}
