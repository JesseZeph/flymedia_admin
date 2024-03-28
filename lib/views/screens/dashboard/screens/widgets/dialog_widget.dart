import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/controllers/influencer_verification_provider.dart';
import 'package:flymedia_admin/models/response/influencer_verification_res.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:provider/provider.dart';

class VerifyDialog extends StatefulWidget {
  final InfluencerverificationRes id;
  final String influencerName;
  final bool showTwoBtns;

  const VerifyDialog({
    Key? key,
    required this.influencerName,
    required this.showTwoBtns,
    required this.id,
  }) : super(key: key);

  @override
  State<VerifyDialog> createState() => _VerifyDialogState();
}

class _VerifyDialogState extends State<VerifyDialog> {
  late bool showTwoButtons;
  late InfluencerverificationRes verification;
  bool verificationCancelled = false;
  bool verifiedTextVisible = true;

  @override
  void initState() {
    super.initState();
    showTwoButtons = widget.showTwoBtns;
    verification = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Color(lightHintTextColor.value),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
          width: width * 0.4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (verifiedTextVisible)
                    showTwoButtons
                        ? Icon(
                            CupertinoIcons.question_circle,
                            color: Colors.green,
                            size: 10.sp,
                          )
                        : Icon(
                            FluentSystemIcons
                                .ic_fluent_checkmark_circle_regular,
                            color: Colors.green,
                            size: 10.sp,
                          ),
                ],
              ),
              SizedBox(height: 16.h),
              if (showTwoButtons)
                CustomKarlaText(
                  text: widget.influencerName,
                  size: 1.sp,
                  weight: FontWeight.w700,
                ),
              SizedBox(height: 12.h),
              if (verifiedTextVisible)
                Text(
                  showTwoButtons
                      ? 'Once this influencer has been verified, they can immediately start applying for campaigns and connecting with influencers. Would you like to verify ${widget.influencerName}?'
                      : "This influencer has been verified! They now have access to view and apply to all campaigns on the app.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 3.sp),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 16.h),
              showTwoButtons
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Color(mainColor.value),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              await context
                                  .read<InfluenceVerificationNotifier>()
                                  .verifyInfluencer(
                                      verificationId: verification.id,
                                      verification: 'Verified');
                              setState(() {
                                showTwoButtons = false;
                                verifiedTextVisible = true;
                              });

                              verificationCancelled = false;
                              // Get.offAll(const AdminOverview());
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              'Yes',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 3.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          width: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color(lightHintTextColor.value)),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              await context
                                  .read<InfluenceVerificationNotifier>()
                                  .verifyInfluencer(
                                    verification: 'Failed',
                                    verificationId: verification.id,
                                  );
                              // Get.off(() => const AdminOverview());
                              setState(() {
                                verificationCancelled = true;
                                showTwoButtons = false;
                                verifiedTextVisible = false;
                              });
                            },
                            child: Text(
                              'No',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 3.sp),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        if (verificationCancelled)
                          Column(
                            children: [
                              Text(
                                'Verification request rejected',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 3.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        Container(
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Color(mainColor.value),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              Get.offAll(const AdminOverview());
                              verificationCancelled = true;
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: Text(
                              'Back to homepage',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 3.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
