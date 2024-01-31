import "package:flutter/material.dart";
import "package:flymedia_admin/models/response/client_list.dart";
import "package:flymedia_admin/models/response/pending_verification.dart";
import "package:flymedia_admin/models/response/total_company.dart";
import "package:flymedia_admin/services/config.dart";
import "package:http/http.dart" as https;
import "package:shared_preferences/shared_preferences.dart";

class VerificationHelper {
  static var client = https.Client();

  static Future<List<PendingVerificationRes>> getPendingVerifications() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    List<PendingVerificationRes> resp = [];
    var url = Uri.https(Config.apiUrl, Config.pendingVerification);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      resp = pendingVerificationResFromJson(response.body);
      return resp;
    } else {
      throw Exception('Failed to get pending verifications');
    }
  }

  static Future<List<ClientListRes>> getClientsCompanyList() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    List<ClientListRes> clients = [];
    var url = Uri.https(Config.apiUrl, Config.clientList);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      clients = clientListResFromJson(response.body);
      return clients;
    } else {
      throw Exception('Failed to get client verifications');
    }
  }

  static Future<TotalCompaniesRes> getCompanyCount() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.totalCompanies);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var totalCompanies = totalCompaniesResFromJson(response.body);
      return totalCompanies;
    } else {
      throw Exception("Error getting company count");
    }
  }

  static Future<bool> verifyCompany(String campaignId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString("token")}',
      };

      var url = Uri.https(Config.apiUrl, "${Config.verifyCompany}/$campaignId");
      var response = await client.post(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      debugPrint("===> error verifying campaign : ${e.toString()}");
      debugPrintStack(stackTrace: s);
      return false;
    }
  }
}
