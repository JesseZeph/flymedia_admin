import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/custom_karla_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ClientListWidget extends StatefulWidget {
  const ClientListWidget({super.key});

  @override
  State<ClientListWidget> createState() => _ClientListWidgetState();
}

class _ClientListWidgetState extends State<ClientListWidget> {
  int pageNumber = 2;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    context.read<VerificationNotifier>().getClientsListing();
  }

  openSocialProfile(String websiteLink, BuildContext context) async {
    var link = Uri.parse(websiteLink);
    try {
      if (!await launchUrl(
        link,
        mode: LaunchMode.inAppBrowserView,
      )) {
        throw Exception('Could not launch website');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
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
                'CLIENTS',
                style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                children: [
                  FittedBox(
                    child: Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.23,
                            child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: CustomKarlaText(
                                text: 'COMPANIES',
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
                                text: 'EMAIL',
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
                                text: 'WEBSITE',
                                size: 4,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Consumer<VerificationNotifier>(
                    builder: (context, verificationNotifier, child) {
                      return verificationNotifier.isFetching
                          ? Center(
                              child: Container(
                                  padding: EdgeInsets.all(20.r),
                                  child: const CircularProgressIndicator()))
                          : verificationNotifier.clientList.isNotEmpty
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
                                          itemCount: verificationNotifier
                                              .clientList.length,
                                          itemBuilder: (context, index) {
                                            var listClient =
                                                verificationNotifier
                                                    .clientList[index];
                                            return Container(
                                              padding: EdgeInsets.only(
                                                  top: 30.h, bottom: 10.h),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          style:
                                                              BorderStyle.solid,
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
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: CustomKarlaText(
                                                        text: listClient
                                                            .companyName,
                                                        size: 4,
                                                        weight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.23,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: CustomKarlaText(
                                                        text: listClient
                                                            .companyEmail,
                                                        size: 4,
                                                        weight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.23,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: CustomKarlaText(
                                                        text: listClient
                                                            .companyHq,
                                                        size: 4,
                                                        weight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.23,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: TextButton(
                                                        onPressed: () =>
                                                            openSocialProfile(
                                                                listClient
                                                                    .website,
                                                                context),
                                                        child: CustomKarlaText(
                                                            text:
                                                                'link to website',
                                                            size: 4,
                                                            weight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                dialogBlue
                                                                    .value)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
