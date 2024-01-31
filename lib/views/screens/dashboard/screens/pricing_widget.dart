import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/subscription_provider.dart';
import 'package:flymedia_admin/models/response/subscription_response.dart';
import 'package:flymedia_admin/services/helpers/subscription_helper.dart';
import 'package:flymedia_admin/utils/extensions/alert_loader.dart';
import 'package:flymedia_admin/utils/extensions/context_extension.dart';
import 'package:flymedia_admin/utils/widgets/fly_button.dart';
import 'package:flymedia_admin/utils/widgets/pricing_container.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/otherScreens/add_and_edit_tiers.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class PricingWidget extends StatefulWidget {
  const PricingWidget({super.key});

  @override
  State<PricingWidget> createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget> {
  late SubscriptionResponse subscription;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    context.read<SubscriptionNotifier>().getSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      progressIndicator: const AlertLoader(message: 'Deleting Subscription'),
      child: Scaffold(
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
            Consumer<SubscriptionNotifier>(
              builder: (context, subscriptionNotifier, child) {
                return subscriptionNotifier.isFetchingSub
                    ? Center(
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          child: const CircularProgressIndicator.adaptive(),
                        ),
                      )
                    : subscriptionNotifier.subscription.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  subscriptionNotifier.subscription.length,
                              itemBuilder: (context, index) {
                                var subscription =
                                    subscriptionNotifier.subscription[index];

                                Color? tierColor;

                                if (subscription.name == 'Pro Tier') {
                                  tierColor =
                                      Color(mainColor.value).withOpacity(0.8);
                                } else if (subscription.name ==
                                    'Premium Tier') {
                                  tierColor = Color(mainColor.value);
                                }

                                Color? flyTextColor;

                                if (subscription.name == 'Pro Tier' ||
                                    subscription.name == 'Premium Tier') {
                                  flyTextColor = Color(mainColor.value);
                                }

                                Color? flyBodyText;

                                if (subscription.name == 'Pro Tier' ||
                                    subscription.name == 'Premium Tier') {
                                  flyBodyText = Color(flyLight.value);
                                }

                                Color? flyButtonColor;

                                if (subscription.name == 'Pro Tier' ||
                                    subscription.name == 'Premium Tier') {
                                  flyButtonColor = Color(flyLight.value);
                                }

                                String? imageUrl;

                                if (subscription.name == 'Pro Tier') {
                                  imageUrl = 'assets/images/solar-star.png';
                                } else if (subscription.name ==
                                    'Premium Tier') {
                                  imageUrl = 'assets/images/diamond-sharp.png';
                                }

                                return Row(
                                  children: [
                                    SubscriptionCardWidget(
                                      flyButton: FlyButton(
                                        flyColorText: flyTextColor ??
                                            Color(flyLight.value),
                                        color: flyButtonColor ??
                                            Color(mainColor.value),
                                        onTap: () {
                                          subUpdate = subscription;
                                          Get.to(() =>
                                              const AddAndEditTiersWidget());
                                        },
                                      ),
                                      textButton: TextButton(
                                        onPressed: () async {
                                          setState(() {
                                            loading = true;
                                          });

                                          await SubscriptionHelper
                                                  .deleteSubscription()
                                              .then((value) {
                                            if (value) {
                                              context
                                                  .read<SubscriptionNotifier>()
                                                  .deleteSubscription(index);
                                              context.showSuccess(
                                                  'Subscription deleted successfully');
                                              Get.back();
                                            } else {
                                              context.showError(
                                                  'Failed to delete subscription');
                                            }
                                            setState(() {
                                              loading = false;
                                            });
                                          });
                                        },
                                        child: Text('Delete Plan',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    fontSize: 3.sp,
                                                    color: flyButtonColor ??
                                                        Color(mainColor.value),
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                      image: imageUrl ??
                                          'assets/images/zondicons_badge.png',
                                      tierText: subscription.name,
                                      priceText: subscription.price,
                                      textColor: flyBodyText ?? Colors.black,
                                      featuresText: subscription.features,
                                      containerColor:
                                          tierColor ?? Color(flyGrey.value),
                                    ),
                                    const WidthSpacer(width: 45)
                                  ],
                                );
                              },
                            ),
                          )
                        : const Center(child: Text('No subscription'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
