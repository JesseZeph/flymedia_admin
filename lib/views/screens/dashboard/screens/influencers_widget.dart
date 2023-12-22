import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';

class InfluencersPageWidget extends StatefulWidget {
  const InfluencersPageWidget({super.key});

  @override
  State<InfluencersPageWidget> createState() => _InfluencersPageWidgetState();
}

class _InfluencersPageWidgetState extends State<InfluencersPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              'Influencers',
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
