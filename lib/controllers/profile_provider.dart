import 'package:flutter/cupertino.dart';
import 'package:flymedia_admin/models/response/get_influencer_profile.dart';
import 'package:flymedia_admin/models/response/pending_verification.dart';
import 'package:flymedia_admin/services/helpers/profile_helper.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileHelper profileHelper = ProfileHelper();
  bool _isFetchingProfile = false;
  bool get isFetchingProfile => _isFetchingProfile;
  List<GetInfluencerProfiles> profile = [];

  Future<void> getProfile() async {
    _isFetchingProfile = !_isFetchingProfile;
    profile = await profileHelper.getUserProfile();
    _isFetchingProfile = !_isFetchingProfile;
    notifyListeners();
  }
}
