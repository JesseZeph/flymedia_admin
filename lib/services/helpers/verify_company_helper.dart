import "package:flymedia_admin/models/response/pending_verification.dart";
import "package:flymedia_admin/models/response/total_company.dart";
import "package:flymedia_admin/services/config.dart";
import "package:http/http.dart" as https;

class VerificationHelper {
  static var client = https.Client();

  static Future<List<PendingVerificationRes>> getPendingVerifications() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    List<PendingVerificationRes> resp = [];
    var url = Uri.https(Config.apiUrl, Config.pendingVerification);
    print(url);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      resp = pendingVerificationResFromJson(response.body);
      print(resp);
      return resp;
    } else {
      throw Exception('Failed to get pending verifications');
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
}
