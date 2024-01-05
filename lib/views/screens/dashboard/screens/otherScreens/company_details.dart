import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/models/response/pending_verification.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/roundedbutton.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:get/get.dart';

class ComapanyDetailsWidget extends StatefulWidget {
  final PendingVerificationRes id;
  const ComapanyDetailsWidget({super.key, required this.id});

  @override
  State<ComapanyDetailsWidget> createState() => _ComapanyDetailsWidgetState();
}

class _ComapanyDetailsWidgetState extends State<ComapanyDetailsWidget> {
  late PendingVerificationRes verifyPending;
  @override
  void initState() {
    super.initState();
    verifyPending = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 15.w),
        child: SizedBox(
            width: width * 0.4,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text(
                  'Company Details',
                  style:
                      appStyle(5, Color(mainTextColor.value), FontWeight.w600),
                ),
              ),
              SizedBox(
                width: width * 0.4,
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.7),
                    1: FlexColumnWidth(1),
                  },
                  border: TableBorder.all(
                    width: 1,
                    color: Color(lightHintTextColor.value).withOpacity(0.3),
                  ),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          'COMPANY NAME',
                          style: appStyle(
                              4, Color(lightMainText.value), FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          verifyPending.companyName,
                          style: appStyle(
                              4, Color(mainTextColor.value), FontWeight.w600),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          'COMPANY HQ',
                          style: appStyle(
                              4, Color(lightMainText.value), FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          verifyPending.companyHq,
                          style: appStyle(
                              3.5, Color(mainTextColor.value), FontWeight.w500),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          'COMPANY WEBSITE URL',
                          style: appStyle(
                              4, Color(lightMainText.value), FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          verifyPending.website,
                          style: appStyle(
                              3.5, Color(dialogBlue.value), FontWeight.w500),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          'COMPANY EMAIL',
                          style: appStyle(
                              4, Color(lightMainText.value), FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          verifyPending.companyEmail,
                          style: appStyle(
                              3.5, Color(mainTextColor.value), FontWeight.w500),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          'CONTACT NUMBER',
                          style: appStyle(
                              4, Color(lightMainText.value), FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 20.h),
                        child: Text(
                          verifyPending.memberContact,
                          style: appStyle(
                              3.5, Color(mainTextColor.value), FontWeight.w500),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              const HeightSpacer(size: 30),
              FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const WidthSpacer(width: 290),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const MiniOutlineRounded(title: 'Back')),
                    const WidthSpacer(width: 20),
                    const MiniRoundedButton(title: 'Verify Company'),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
