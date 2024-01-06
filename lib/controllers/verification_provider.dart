import 'package:flutter/material.dart';
import 'package:flymedia_admin/models/response/client_list.dart';
import 'package:flymedia_admin/models/response/pending_verification.dart';
import 'package:flymedia_admin/models/response/total_company.dart';
import 'package:flymedia_admin/services/helpers/verify_company_helper.dart';

class VerificationNotifier extends ChangeNotifier {
  List<PendingVerificationRes> pendingVerificationList = [];
  List<ClientListRes> clientList = [];
  late Future<TotalCompaniesRes> totalCompanies;

  bool _isVerifying = false;
  bool get isVerifying => _isVerifying;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<void> getPendings() async {
    _isFetching = !_isFetching;
    pendingVerificationList =
        await VerificationHelper.getPendingVerifications();
    _isFetching = !_isFetching;
    notifyListeners();
  }

  Future<void> getClientsListing() async {
    _isFetching = !_isFetching;
    clientList = await VerificationHelper.getClientsCompanyList();
    _isFetching = !_isFetching;
    notifyListeners();
  }

  Future<TotalCompaniesRes> getTotalCompanies() {
    totalCompanies = VerificationHelper.getCompanyCount();
    return totalCompanies;
  }

  Future<void> verifyCompany(String campaignId) async {
    _isVerifying = true;
    notifyListeners();

    bool isSuccess = await VerificationHelper.verifyCompany(campaignId);

    if (isSuccess) {
      print('Company verification successful');
    } else {
      print('Company verification failed');
    }
    _isVerifying = false;
    notifyListeners();
  }
}
