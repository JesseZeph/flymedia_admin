import 'package:flutter/cupertino.dart';
import 'package:flymedia_admin/models/response/influencer_verification_res.dart';
import 'package:flymedia_admin/services/config.dart';
import 'package:flymedia_admin/services/repository/global_variables.dart';

class InfluenceVerificationNotifier extends ChangeNotifier {
  InfluencerverificationRes? verifyResponse;

  Future<List<InfluencerverificationRes>> getAllVerification() async {
    var response = await repository.getRequest(
      endpoint: Config.verifyInfluencer,
      requiresHeader: true,
    );
    if (response.status) {
      List initList = response.data;
      List<InfluencerverificationRes> verificationList = initList.map((item) {
        return InfluencerverificationRes.fromMap(item);
      }).toList();
      return verificationList;
    }
    return [];
  }

  Future<void> verifyInfluencer(
      {required String verificationId, required String verification}) async {
    try {
      var response = await repository.putRequest(
          endpoint: Config.verifyInfluencer,
          requiresHeader: true,
          body: {
            "verification_id": verificationId,
            "verification": verification
          });
      if (response.status) {
        verifyResponse = InfluencerverificationRes.fromMap(response.data);
        notifyListeners();
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
    }
  }
}
