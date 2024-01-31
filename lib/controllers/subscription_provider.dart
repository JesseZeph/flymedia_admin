import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/subscription_response.dart';
import 'package:flymedia_admin/services/helpers/subscription_helper.dart';

class SubscriptionNotifier extends ChangeNotifier {
  SubscriptionHelper subscriptionHelper = SubscriptionHelper();
  bool _isFetchingSub = false;
  bool get isFetchingSub => _isFetchingSub;
  List<SubscriptionResponse> subscription = [];

  Future<void> getSubscriptions() async {
    _isFetchingSub = !_isFetchingSub;
    subscription = await subscriptionHelper.getAllSubscriptions();
    _isFetchingSub = !_isFetchingSub;
    notifyListeners();
  }

  deleteSubscription(int index) {
    subscription.removeAt(index);
    notifyListeners();
  }
}
