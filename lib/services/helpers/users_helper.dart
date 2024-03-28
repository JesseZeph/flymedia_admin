import "package:flymedia_admin/models/response/total_influencers.dart";
import "package:flymedia_admin/models/response/total_users.dart";
import "package:flymedia_admin/services/config.dart";
import "package:http/http.dart" as https;

class UsersHelper {
  static var client = https.Client();

  static Future<TotalInfluencersRes> getInfluencersCount() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(AppConfig.apiUrl, AppConfig.totalInfluencers);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var totalInfluencers = totalInfluencersResFromJson(response.body);
      return totalInfluencers;
    } else {
      throw Exception("Error getting company count");
    }
  }

  static Future<TotalUsersRes> getUsersCount() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(AppConfig.apiUrl, AppConfig.totalUsers);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var totalUsers = totalUsersResFromJson(response.body);
      return totalUsers;
    } else {
      throw Exception("Error getting company count");
    }
  }
}
