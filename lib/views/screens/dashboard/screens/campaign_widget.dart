import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/campaign_provider.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/utils/extensions/string_formatter.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';
import 'package:provider/provider.dart';

class CampaignListPage extends StatefulWidget {
  const CampaignListPage({super.key});

  @override
  State<CampaignListPage> createState() => _CampaignListPageState();
}

class _CampaignListPageState extends State<CampaignListPage> {
  int pageNumber = 2;
  bool hasMoreData = true;

  var listController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<VerificationNotifier>().getClientsListing();
    context.read<CampaignNotifier>().getCampaigns(1);
    listController.addListener(loadMore);
  }

  loadMore() async {
    if (listController.position.extentAfter < 5 && hasMoreData) {
      hasMoreData = await context
          .read<CampaignNotifier>()
          .getCampaigns(pageNumber, isLoadingMore: true);
      if (hasMoreData) {
        pageNumber += 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      body: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Text(
                'CAMPAIGNS',
                style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                children: [
                  FittedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.23,
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomKarlaText(
                              text: 'TITLE',
                              size: 4,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.23,
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomKarlaText(
                              text: 'PAYMENT',
                              size: 4,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.23,
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomKarlaText(
                              text: 'LOCATION',
                              size: 4,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.23,
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomKarlaText(
                              text: 'PAYMENT STATUS',
                              size: 4,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<CampaignNotifier>(
                    builder: (context, campaignNotifier, child) {
                      return campaignNotifier.isFetching
                          ? Center(
                              child: Container(
                                  padding: EdgeInsets.all(20.r),
                                  child: const CircularProgressIndicator()))
                          : campaignNotifier.campaignList.isNotEmpty
                              // ignore: sized_box_for_whitespace
                              ? FittedBox(
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                      width: width,
                                      height: height * 0.65,
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          itemCount: campaignNotifier
                                              .campaignList.length,
                                          itemBuilder: (context, index) {
                                            var clientCampaign =
                                                campaignNotifier
                                                    .campaignList[index];
                                            return FittedBox(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: 30.h, bottom: 10.h),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            style: BorderStyle
                                                                .solid,
                                                            width: 1,
                                                            color: Color(
                                                                    lightHintTextColor
                                                                        .value)
                                                                .withOpacity(
                                                                    0.3)))),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: width * 0.23,
                                                      child: Row(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                              width: 15.w,
                                                              height: 15.w,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.r),
                                                                child: Image
                                                                    .network(
                                                                  clientCampaign
                                                                      .imageUrl,
                                                                  fit: BoxFit
                                                                      .cover, // Use BoxFit.cover to fill the container
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const WidthSpacer(
                                                              width: 10),
                                                          CustomKarlaText(
                                                            text: clientCampaign
                                                                .jobTitle,
                                                            size: 4,
                                                            weight:
                                                                FontWeight.w400,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.23,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: CustomKarlaText(
                                                          text:
                                                              '\$${clientCampaign.rate.formatComma()}',
                                                          size: 4,
                                                          weight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.23,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: CustomKarlaText(
                                                          text: clientCampaign
                                                              .country,
                                                          size: 4,
                                                          weight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.23,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: CustomKarlaText(
                                                          text: clientCampaign
                                                                  .isPaidFor
                                                              ? 'Paid'
                                                              : 'Unpaid',
                                                          size: 4,
                                                          weight:
                                                              FontWeight.w400,
                                                          color: clientCampaign
                                                                  .isPaidFor
                                                              ? Color(greenTick
                                                                  .value)
                                                              : Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })),
                                )
                              : const Center(
                                  child: Text('No campaign available'));
                    },
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
