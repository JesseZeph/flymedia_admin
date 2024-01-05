import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/total_influencers.dart';
import 'package:flymedia_admin/models/response/total_users.dart';
import 'package:flymedia_admin/services/helpers/users_helper.dart';

class UsersNotifier extends ChangeNotifier {
  late Future<TotalInfluencersRes> totalInfluencers;
  late Future<TotalUsersRes> totalUsers;

  Future<TotalInfluencersRes> getTotalInfluencers() {
    totalInfluencers = UsersHelper.getInfluencersCount();
    return totalInfluencers;
  }

  Future<TotalUsersRes> getTotalUsers() {
    totalUsers = UsersHelper.getUsersCount();
    return totalUsers;
  }
}
