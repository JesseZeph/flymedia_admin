import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/otherScreens/add_admin.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/otherScreens/company_details.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/card_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OverviewPageWidget extends StatefulWidget {
  const OverviewPageWidget({super.key});

  @override
  State<OverviewPageWidget> createState() => _OverviewPageWidgetState();
}

class _OverviewPageWidgetState extends State<OverviewPageWidget> {
  @override
  Widget build(BuildContext context) {
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
                        color:
                            Color(lightHintTextColor.value).withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.plus,
                      color: Color(mainTextColor.value).withOpacity(0.8),
                      size: 15,
                    ),
                    const WidthSpacer(width: 8),
                    Text(
                      'Create Admin',
                      style: appStyle(
                          3,
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
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OverviewCardWidget(
                text: 'Total no. of companies',
                subText: '942',
              ),
              const WidthSpacer(width: 45),
              OverviewCardWidget(
                text: 'Total no. of influencers',
                subText: '1032',
                containerColor: Color(purplePatch.value),
                icon: Icons.person_2_rounded,
              ),
              const WidthSpacer(width: 45),
              OverviewCardWidget(
                text: 'Active users',
                subText: '123',
                containerColor: Color(orangeTint.value),
                icon: Icons.person_2_rounded,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h, top: 40.h),
            child: Text(
              'Pending Verifications',
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
            ),
          ),
          Row(
            children: [
              VerificationCard(
                text: 'ShopWebly',
                website: 'Singapore',
                countryName: 'www.shopwebly@homework.com',
                onTap: () {
                  Get.to(() => const ComapanyDetailsWidget());
                },
              ),
              const WidthSpacer(width: 15),
              VerificationCard(
                text: 'ShopWebly',
                website: 'Singapore',
                countryName: 'www.shopwebly@homework.com',
                onTap: () {},
              ),
              const WidthSpacer(width: 15),
              VerificationCard(
                text: 'ShopWebly',
                website: 'Singapore',
                countryName: 'www.shopwebly@homework.com',
                onTap: () {},
              ),
              const WidthSpacer(width: 15),
              VerificationCard(
                text: 'ShopWebly',
                website: 'Singapore',
                countryName: 'www.shopwebly@homework.com',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
