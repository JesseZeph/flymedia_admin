import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/controllers/login_provider.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/models/response/pending_verification.dart';
import 'package:flymedia_admin/models/response/total_company.dart';
import 'package:flymedia_admin/models/response/total_influencers.dart';
import 'package:flymedia_admin/models/response/total_users.dart';
import 'package:flymedia_admin/services/helpers/users_helper.dart';
import 'package:flymedia_admin/services/helpers/verify_company_helper.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/auth/authpage.dart';
import 'package:flymedia_admin/views/screens/auth/sign_in/sign_in_widget.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/otherScreens/add_admin.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/otherScreens/company_details.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/card_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

class OverviewPageWidget extends StatefulWidget {
  const OverviewPageWidget({super.key});

  @override
  State<OverviewPageWidget> createState() => _OverviewPageWidgetState();
}

class _OverviewPageWidgetState extends State<OverviewPageWidget> {
  late Future<TotalCompaniesRes> totalCompanies;
  late Future<TotalInfluencersRes> totalInfluencers;
  late Future<TotalUsersRes> totalUsers;

  @override
  void initState() {
    super.initState();
    getTotalCompanies();
    getTotalInfluencers();
    getTotalUsers();

    context.read<VerificationNotifier>().getPendings();
  }

  getTotalCompanies() {
    totalCompanies = VerificationHelper.getCompanyCount();
  }

  getTotalInfluencers() {
    totalInfluencers = UsersHelper.getInfluencersCount();
  }

  getTotalUsers() {
    totalUsers = UsersHelper.getUsersCount();
  }

  @override
  Widget build(BuildContext context) {
    var loggedIn = context.watch<LoginNotifier>().loggedIn;
    return !loggedIn
        ? const SignInWidget()
        : Consumer<VerificationNotifier>(
            builder: (context, verificationNotifier, child) {
              verificationNotifier.getTotalCompanies();
              return Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AddAdminWidget());
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: width * 0.08,
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color(lightHintTextColor.value)
                                      .withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.plus,
                                color:
                                    Color(mainTextColor.value).withOpacity(0.8),
                                size: 15,
                              ),
                              const WidthSpacer(width: 8),
                              Text(
                                'Create Admin',
                                style: appStyle(
                                    2.5,
                                    Color(mainTextColor.value).withOpacity(0.8),
                                    FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        'Overview',
                        style: appStyle(
                            5, Color(mainTextColor.value), FontWeight.w600),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<TotalCompaniesRes>(
                          future: totalCompanies,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final totalCompanies = snapshot.data;
                              return OverviewCardWidget(
                                text: 'Total no. of companies',
                                subText:
                                    totalCompanies!.totalCompanies.toString(),
                              );
                            }
                          },
                        ),
                        const WidthSpacer(width: 45),
                        FutureBuilder<TotalInfluencersRes>(
                            future: totalInfluencers,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final totalInfluencers = snapshot.data;
                                return OverviewCardWidget(
                                  text: 'Total no. of influencers',
                                  subText: totalInfluencers!.totalInfluencers
                                      .toString(),
                                  containerColor: Color(purplePatch.value),
                                  icon: Icons.person_2_rounded,
                                );
                              }
                            }),
                        const WidthSpacer(width: 45),
                        FutureBuilder<TotalUsersRes>(
                          future: totalUsers,
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final totalUsers = snapshot.data;
                              return OverviewCardWidget(
                                text: 'Active users',
                                subText: totalUsers!.totalUsers.toString(),
                                containerColor: Color(orangeTint.value),
                                icon: Icons.person_2_rounded,
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
                      child: Text(
                        'Pending Verifications',
                        style: appStyle(
                            5, Color(mainTextColor.value), FontWeight.w600),
                      ),
                    ),
                    verificationNotifier.isFetching
                        ? Center(
                            child: Container(
                              padding: EdgeInsets.all(20.r),
                              child: const CircularProgressIndicator.adaptive(),
                            ),
                          )
                        : verificationNotifier
                                .pendingVerificationList.isNotEmpty
                            ? SizedBox(
                                height: height * 0.2,
                                child: ListView.builder(
                                  itemCount: verificationNotifier
                                      .pendingVerificationList.length,
                                  scrollDirection: Axis.horizontal,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var pendingVerification =
                                        verificationNotifier
                                            .pendingVerificationList[index];
                                    return SizedBox(
                                      height: height * 0.2,
                                      child: PendingVerificationWidget(
                                        verifyPending: pendingVerification,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const Center(
                                child: Text('No pending Verifications'),
                              )
                  ],
                ),
              );
            },
          );
  }
}

class PendingVerificationWidget extends StatelessWidget {
  final PendingVerificationRes verifyPending;
  const PendingVerificationWidget({
    super.key,
    required this.verifyPending,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VerificationCard(
          text: verifyPending.companyName,
          website: verifyPending.website,
          countryName: verifyPending.companyHq,
          onTap: () {
            Get.to(() => ComapanyDetailsWidget(id: verifyPending));
          },
        ),
        const WidthSpacer(width: 46),
      ],
    );
  }
}
