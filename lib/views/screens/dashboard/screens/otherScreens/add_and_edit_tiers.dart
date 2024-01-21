import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/utils/widgets/fly_button.dart';
import 'package:flymedia_admin/utils/widgets/pricing_container.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_inputfield.dart';
import 'package:provider/provider.dart';

class AddAndEditTiersWidget extends StatefulWidget {
  const AddAndEditTiersWidget({super.key});

  @override
  State<AddAndEditTiersWidget> createState() => _AddAndEditTiersWidgetState();
}

class _AddAndEditTiersWidgetState extends State<AddAndEditTiersWidget> {
  @override
  // void initState() {
  //   super.initState();
  //   context.read<VerificationNotifier>().getClientsListing();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 25.h),
              child: Text(
                'Pricing Plans',
                style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
              ),
            ),
            SizedBox(
              width: width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Text(
                      'Name of Tier',
                      style: appStyle(
                          3, Color(mainTextColor.value), FontWeight.w400),
                    ),
                  ),
                  TextInputField(
                    hintText: '',
                    onChanged: (_) {},
                  ),
                  HeightSpacer(size: 20.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Text(
                      'Amount (\$)',
                      style: appStyle(
                          3, Color(mainTextColor.value), FontWeight.w400),
                    ),
                  ),
                  TextInputField(
                    hintText: '',
                    onChanged: (_) {},
                  ),
                  HeightSpacer(size: 20.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Text(
                      'Tier Features',
                      style: appStyle(
                          3, Color(mainTextColor.value), FontWeight.w400),
                    ),
                  ),
                  CustomInputField(
                    hintText: '',
                    onChanged: (_) {},
                    maxLines: 5,
                  ),
                  HeightSpacer(size: 30.h),
                  FlyButton(
                    color: Color(mainColor.value),
                    textColor: Color(flyLight.value),
                    title: 'Save Plan',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
