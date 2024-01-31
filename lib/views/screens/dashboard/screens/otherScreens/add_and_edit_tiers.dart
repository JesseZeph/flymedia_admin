import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/models/requests/auth/subscription_request.dart';
import 'package:flymedia_admin/services/helpers/subscription_helper.dart';
import 'package:flymedia_admin/utils/extensions/alert_loader.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/utils/widgets/fly_button.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/height_spacer.dart';
import 'package:flymedia_admin/views/common/text_input_field.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_inputfield.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class AddAndEditTiersWidget extends StatefulWidget {
  const AddAndEditTiersWidget({super.key});

  @override
  State<AddAndEditTiersWidget> createState() => _AddAndEditTiersWidgetState();
}

class _AddAndEditTiersWidgetState extends State<AddAndEditTiersWidget> {
  TextEditingController name = TextEditingController(text: subUpdate!.name);
  TextEditingController price = TextEditingController(text: subUpdate!.price);
  TextEditingController features =
      TextEditingController(text: subUpdate!.features);
  GlobalKey<FormState> formkey = GlobalKey();
  var loading = false;

  bool isValid() {
    List<String> fields = [
      name.text,
      price.text,
      features.text,
    ];
    return fields.every((field) => field.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      progressIndicator: const AlertLoader(message: 'Updating! Please wait.'),
      child: Scaffold(
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
                  style:
                      appStyle(5, Color(mainTextColor.value), FontWeight.w600),
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
                      controller: name,
                      hintText: '',
                      onChanged: (_) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('Field is empty, please input tier name');
                        } else {
                          return null;
                        }
                      },
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
                      controller: price,
                      hintText: '',
                      onChanged: (_) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('Field is empty, please input tier price');
                        } else {
                          return null;
                        }
                      },
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
                      controller: features,
                      hintText: '',
                      onChanged: (_) {},
                      maxLines: 5,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('Field is empty, please input tier description');
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 30.h),
                    FlyButton(
                        color: Color(mainColor.value),
                        flyColorText: Color(flyLight.value),
                        title: 'Save Plan',
                        onTap: () async {
                          if (isValid()) {
                            setState(() {
                              loading = !loading;
                            });
                            SubscriptionRequest rawModel = SubscriptionRequest(
                              price: price.text,
                              name: name.text,
                              subId: subUpdate!.id,
                              features: features.text,
                            );
                            var model = subscriptionRequestToJson(rawModel);
                            await SubscriptionHelper.editSubscription(model)
                                .then((result) {
                              setState(() {
                                loading = !loading;
                              });
                              if (result) {
                                Get.to(() => const AdminOverview());
                              } else {
                                context.showError('An error occured');
                              }
                            });
                          } else {
                            context.showError('One or more fields are empty');
                          }
                        })
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
