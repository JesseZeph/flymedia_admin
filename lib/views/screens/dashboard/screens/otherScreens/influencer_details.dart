import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/models/response/influencer_verification_res.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/dialog_widget.dart';
import 'package:get/get.dart';

class InfluencerDetailsWidget extends StatefulWidget {
  final InfluencerverificationRes id;
  const InfluencerDetailsWidget({super.key, required this.id});

  @override
  State<InfluencerDetailsWidget> createState() => _InflueencerDetailsState();
}

class _InflueencerDetailsState extends State<InfluencerDetailsWidget> {
  late InfluencerverificationRes verification;

  @override
  void initState() {
    super.initState();
    verification = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
              child: Text(
                'Influencer Details',
                style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150.r),
                  child: Image.network(
                    verification.influencer.verificationImage,
                    fit: BoxFit.cover, // Use BoxFit.cover to fill the container
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
                      child: Text(
                        "INFLUENCER'S NAME",
                        style: appStyle(
                            3, Color(mainTextColor.value), FontWeight.w400),
                      ),
                    ),
                    TextTileWidget(
                        text: verification.influencer.firstAndLastName),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
                      child: Text(
                        "LOCATION",
                        style: appStyle(
                            3, Color(mainTextColor.value), FontWeight.w400),
                      ),
                    ),
                    TextTileWidget(text: verification.influencer.location),
                  ],
                ),
                const WidthSpacer(width: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
                      child: Text(
                        "LINK TO TIKTOK PROFILE",
                        style: appStyle(
                            3, Color(mainTextColor.value), FontWeight.w400),
                      ),
                    ),
                    TextTileWidget(
                      text: verification.influencer.tikTokLink,
                      textColor: Colors.blue.withOpacity(0.8),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
                      child: Text(
                        "AVERAGE NUMBER OF TIKTOK VIEWS",
                        style: appStyle(
                            3, Color(mainTextColor.value), FontWeight.w400),
                      ),
                    ),
                    TextTileWidget(text: verification.influencer.postsViews),
                  ],
                ),
              ],
            ),
            const HeightSpacer(size: 35),
            FittedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WidthSpacer(width: 478),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const MiniOutlineRounded(title: 'Cancel')),
                  const WidthSpacer(width: 20),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return VerifyDialog(
                              showTwoBtns: true,
                              influencerName:
                                  verification.influencer.firstAndLastName,
                              id: widget.id,
                            );
                          },
                        );
                      },
                      child:
                          const MiniRoundedButton(title: 'Verify Influencer')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextTileWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  const TextTileWidget({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(flyGrey.value)),
          borderRadius: BorderRadius.circular(7.r)),
      child: Text(
        text,
        style: appStyle(
            4, textColor ?? Color(mainTextColor.value), FontWeight.w500),
      ),
    );
  }
}
