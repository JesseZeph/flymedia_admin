import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/pending_verification.dart';
import 'package:flymedia_admin/models/response/total_company.dart';
import 'package:flymedia_admin/services/helpers/verify_company_helper.dart';

class VerificationNotifier extends ChangeNotifier {
  List<PendingVerificationRes> pendingVerificationList = [];
  late Future<TotalCompaniesRes> totalCompanies;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<void> getPendings() async {
    _isFetching = !_isFetching;
    pendingVerificationList =
        await VerificationHelper.getPendingVerifications();
    _isFetching = !_isFetching;
    notifyListeners();
  }

  Future<TotalCompaniesRes> getTotalCompanies() {
    totalCompanies = VerificationHelper.getCompanyCount();
    return totalCompanies;
  }
}
