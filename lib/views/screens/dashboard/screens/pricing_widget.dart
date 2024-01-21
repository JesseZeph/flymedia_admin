import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/utils/widgets/fly_button.dart';
import 'package:flymedia_admin/utils/widgets/pricing_container.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/otherScreens/add_and_edit_tiers.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PricingWidget extends StatefulWidget {
  const PricingWidget({super.key});

  @override
  State<PricingWidget> createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<VerificationNotifier>().getClientsListing();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              'Pricing Plans',
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
            ),
          ),
          FittedBox(
            child: Row(
              children: [
                FittedBox(
                  child: SubscriptionCardWidget(
                    flyButton: FlyButton(
                      textColor: Color(flyLight.value),
                      color: Color(mainColor.value),
                      onTap: () {
                        Get.to(() => const AddAndEditTiersWidget());
                      },
                    ),
                    textButton: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete Plan',
                        style: appStyle(
                            3, Color(mainColor.value), FontWeight.w500),
                      ),
                    ),
                    image: 'assets/images/zondicons_badge.png',
                    tierText: 'Basic Tier',
                    priceText: '19.90',
                    featuresText:
                        '•  Post 2 campaign listings a month\n•  Talk to 4 influencer applicants per month\n•  Admin support in brainstorming ideas',
                  ),
                ),
                const WidthSpacer(width: 50),
                FittedBox(
                  child: SubscriptionCardWidget(
                    containerColor: Color(mainColor.value).withOpacity(0.8),
                    flyButton: FlyButton(onTap: () {}),
                    textButton: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete Plan',
                        style: appStyle(3, Colors.white, FontWeight.w500),
                      ),
                    ),
                    image: 'assets/images/solar-star.png',
                    tierText: 'Pro Tier',
                    textColor: Colors.white,
                    priceText: '19.90',
                    featuresText:
                        '•  Post 2 campaign listings a month\n•  Talk to 4 influencer applicants per month\n•  Admin support in brainstorming ideas\n•  Admin support in brainstorming ideas',
                  ),
                ),
                const WidthSpacer(width: 50),
                FittedBox(
                  child: SubscriptionCardWidget(
                    containerColor: Color(mainColor.value),
                    flyButton: FlyButton(onTap: () {}),
                    textButton: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete Plan',
                        style: appStyle(3, Colors.white, FontWeight.w500),
                      ),
                    ),
                    image: 'assets/images/diamond-sharp.png',
                    tierText: 'Premium Tier',
                    textColor: Colors.white,
                    priceText: '19.90',
                    featuresText:
                        '•  Post 2 campaign listings a month\n•  Talk to 4 influencer applicants per month\n•  Admin support in brainstorming ideas\n•  Admin support in brainstorming ideas\n•  Talk to 4 influencer applicants per month',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
