import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/profile_provider.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:provider/provider.dart';

class InfluencersPageWidget extends StatefulWidget {
  const InfluencersPageWidget({super.key});

  @override
  State<InfluencersPageWidget> createState() => _InfluencersPageWidgetState();
}

class _InfluencersPageWidgetState extends State<InfluencersPageWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                'Influencers',
                style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
              ),
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileNotifier, child) {
                return Container(
                    padding: EdgeInsets.only(
                        top: 50.h, left: 5.w, right: 5.w, bottom: 5.w),
                    decoration: BoxDecoration(
                        color: Color(lightHintTextColor.value).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: profileNotifier.isFetchingProfile
                        ? Center(
                            child: Container(
                                padding: EdgeInsets.all(20.r),
                                child: const CircularProgressIndicator()))
                        : profileNotifier.profile.isNotEmpty
                            ? SizedBox(
                                width: width,
                                height: height * 0.2,
                                child: ListView.builder(
                                    itemCount: profileNotifier.profile.length,
                                    itemBuilder: (context, index) {
                                      var profile =
                                          profileNotifier.profile[index];
                                      return FittedBox(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(flyLight.value),
                                          ),
                                          child: DataTable(
                                            columns: [
                                              DataColumn(
                                                label: Icon(
                                                  Icons.square_outlined,
                                                  color: Color(
                                                          lightHintTextColor
                                                              .value)
                                                      .withOpacity(0.4),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 40.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Text(
                                                    'INFLUENCERS',
                                                    style: appStyle(
                                                        5,
                                                        Color(mainTextColor
                                                            .value),
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 40.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Text(
                                                    'FOLLOWERS',
                                                    style: appStyle(
                                                        5,
                                                        Color(mainTextColor
                                                            .value),
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 45.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Text(
                                                    'TIKTOK PROFILE',
                                                    style: appStyle(
                                                        5,
                                                        Color(mainTextColor
                                                            .value),
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 45.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Text(
                                                    'STATUS',
                                                    style: appStyle(
                                                        5,
                                                        Color(mainTextColor
                                                            .value),
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            rows: [
                                              DataRow(cells: [
                                                DataCell(Icon(
                                                    Icons.square_outlined,
                                                    color: Color(
                                                            lightHintTextColor
                                                                .value)
                                                        .withOpacity(0.4))),
                                                DataCell(Text(
                                                  profile.firstAndLastName,
                                                  style: appStyle(
                                                      4,
                                                      Color(
                                                          mainTextColor.value),
                                                      FontWeight.w400),
                                                )),
                                                DataCell(Text(
                                                    profile.noOfTikTokFollowers,
                                                    style: appStyle(
                                                        4,
                                                        Color(mainTextColor
                                                            .value),
                                                        FontWeight.w400))),
                                                DataCell(Container(
                                                  width: 100.w,
                                                  child: Text(
                                                      profile.tikTokLink,
                                                      style: appStyle(
                                                          4,
                                                          Color(
                                                              dialogBlue.value),
                                                          FontWeight.w400)),
                                                )),
                                                DataCell(TextButton(
                                                    onPressed: () {},
                                                    child: Container(
                                                      width: 17.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 5.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                            lightMain.value),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Text('Paid',
                                                          style: appStyle(
                                                              3,
                                                              Color(mainColor
                                                                  .value),
                                                              FontWeight.w400)),
                                                    ))),
                                              ])
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : const Center(
                                child: Text('No influencers available'),
                              ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
