import 'package:flutter/cupertino.dart';
import 'package:flymedia_admin/models/response/campaign_res.dart';
import 'package:flymedia_admin/services/helpers/campaign_helper.dart';

class CampaignNotifier extends ChangeNotifier {
  List<CampaignUploadResponse> campaignList = [];

  bool _isFetching = true;
  bool get isFetching => _isFetching;

  Future<bool> getCampaigns(int page, {bool isLoadingMore = false}) async {
    bool canLoadMore = true;
    if (isLoadingMore) {
      var newList = await CampaignHelper.getCampaigns(page);
      campaignList.addAll(newList);
      canLoadMore = newList.isNotEmpty && newList.length == 50;
    } else {
      campaignList = await CampaignHelper.getCampaigns(page);
      canLoadMore = campaignList.isNotEmpty && campaignList.length == 50;
    }
    _isFetching = false;
    notifyListeners();
    return canLoadMore;
  }
}
