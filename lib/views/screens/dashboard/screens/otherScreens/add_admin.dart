import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/views/common/add_admin_fields.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/screens/auth/sign_up/button.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/overview_widget.dart';
import 'package:get/get.dart';

class AddAdminWidget extends StatefulWidget {
  const AddAdminWidget({super.key});

  @override
  State<AddAdminWidget> createState() => _AddAdminWidgetState();
}

class _AddAdminWidgetState extends State<AddAdminWidget> {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    fullname.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(flyLight.value),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 18.r,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Color(flyLight.value),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: width * 0.3,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Text(
                    'Create Admin',
                    style: appStyle(
                        5, Color(mainTextColor.value), FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                AdminNameWidget(
                  fullname: fullname,
                ),
                SizedBox(
                  height: 25.h,
                ),
                AdminEmailWidget(
                  email: email,
                ),
                SizedBox(
                  height: 25.h,
                ),
                AdminPasswordWidget(
                  password: password,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'This can be changed by admin while logging in',
                      style: appStyle(
                          2, Color(lightMainText.value), FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                AddAdminButton(onTap: () {
                  // Get.to(() => const ());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
