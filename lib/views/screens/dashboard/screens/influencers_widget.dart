import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/profile_provider.dart';
import 'package:flymedia_admin/utils/extensions/string_formatter.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InfluencersPageWidget extends StatefulWidget {
  const InfluencersPageWidget({Key? key}) : super(key: key);

  @override
  State<InfluencersPageWidget> createState() => _InfluencersPageWidgetState();
}

class _InfluencersPageWidgetState extends State<InfluencersPageWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().getProfile();
  }

  openSocialProfile(String websiteLink, BuildContext context) async {
    var link = Uri.parse(websiteLink);
    try {
      if (!await launchUrl(
        link,
        mode: LaunchMode.inAppBrowserView,
      )) {
        throw Exception('Could not launch website');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Text(
                  'INFLUENCERS',
                  style: appStyle(
                    5,
                    Color(mainTextColor.value),
                    FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  children: [
                    FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.23,
                            child: const Align(
                              alignment: Alignment.center,
                              child: CustomKarlaText(
                                text: 'INFLUENCERS',
                                size: 4,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.23,
                            child: const Align(
                              alignment: Alignment.center,
                              child: CustomKarlaText(
                                text: 'FOLLOWERS',
                                size: 4,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.23,
                            child: const Align(
                              alignment: Alignment.center,
                              child: CustomKarlaText(
                                text: 'LOCATION',
                                size: 4,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.23,
                            child: const Align(
                              alignment: Alignment.center,
                              child: CustomKarlaText(
                                text: 'TIKTOK PROFILE',
                                size: 4,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<ProfileProvider>(
                      builder: (context, profileNotifier, child) {
                        return profileNotifier.isFetchingProfile
                            ? Center(
                                child: Container(
                                  padding: EdgeInsets.all(20.r),
                                  child: const CircularProgressIndicator(),
                                ),
                              )
                            : profileNotifier.profile.isNotEmpty
                                // ignore: sized_box_for_whitespace
                                ? Container(
                                    width: width,
                                    height: height * 0.65,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: profileNotifier.profile.length,
                                      itemBuilder: (context, index) {
                                        var profileList =
                                            profileNotifier.profile[index];
                                        return FittedBox(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 30.h, bottom: 10.h),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 1,
                                                  color: Color(
                                                          lightHintTextColor
                                                              .value)
                                                      .withOpacity(0.3),
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.23,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          width: 15.w,
                                                          height: 15.w,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            child:
                                                                Image.network(
                                                              profileList
                                                                  .imageUrl,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const WidthSpacer(
                                                          width: 10),
                                                      CustomKarlaText(
                                                        text: profileList
                                                            .firstAndLastName,
                                                        size: 4,
                                                        weight: FontWeight.w400,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.23,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: CustomKarlaText(
                                                      text: profileList
                                                          .noOfTikTokFollowers
                                                          .formatFigures(),
                                                      size: 4,
                                                      weight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.23,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: CustomKarlaText(
                                                      text:
                                                          profileList.location,
                                                      size: 4,
                                                      weight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.23,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: TextButton(
                                                      onPressed: () =>
                                                          openSocialProfile(
                                                              profileList
                                                                  .tikTokLink,
                                                              context),
                                                      child: CustomKarlaText(
                                                          text:
                                                              'link to TikTok profile',
                                                          size: 4,
                                                          weight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              dialogBlue
                                                                  .value)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const Center(
                                    child: Text('No campaign available'),
                                  );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
