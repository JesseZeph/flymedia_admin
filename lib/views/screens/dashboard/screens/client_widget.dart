import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/views/common/appstyle.dart';
import 'package:provider/provider.dart';

class ClientPageWidget extends StatefulWidget {
  const ClientPageWidget({super.key});

  @override
  State<ClientPageWidget> createState() => _ClientPageWidgetState();
}

class _ClientPageWidgetState extends State<ClientPageWidget> {
  @override
  void initState() {
    super.initState();
    context.read<VerificationNotifier>().getClientsListing();
  }

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
              'Clients',
              style: appStyle(5, Color(mainTextColor.value), FontWeight.w600),
            ),
          ),
          Consumer<VerificationNotifier>(
              builder: (context, verificationNotifier, child) {
            return Container(
                padding: EdgeInsets.only(
                    top: 50.h, left: 5.w, right: 5.w, bottom: 5.w),
                decoration: BoxDecoration(
                    color: Color(lightHintTextColor.value).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5.r)),
                child: verificationNotifier.isFetching
                    ? Center(
                        child: Container(
                            padding: EdgeInsets.all(20.r),
                            child: const CircularProgressIndicator()))
                    : verificationNotifier.clientList.isNotEmpty
                        ? SizedBox(
                            width: width,
                            height: height * 0.2,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount:
                                    verificationNotifier.clientList.length,
                                itemBuilder: ((context, index) {
                                  var clients =
                                      verificationNotifier.clientList[index];
                                  return FittedBox(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(flyLight.value),
                                      ),
                                      child: DataTable(
                                        columns: [
                                          DataColumn(
                                            label: Icon(
                                              Icons.square_outlined,
                                              color: Color(
                                                      lightHintTextColor.value)
                                                  .withOpacity(0.4),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 45.w,
                                                  top: 5.h,
                                                  bottom: 5.h),
                                              child: Text(
                                                'COMPANIES',
                                                style: appStyle(
                                                    5,
                                                    Color(mainTextColor.value),
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 45.w,
                                                  top: 5.h,
                                                  bottom: 5.h),
                                              child: Text(
                                                'Email',
                                                style: appStyle(
                                                    5,
                                                    Color(mainTextColor.value),
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 45.w,
                                                  top: 5.h,
                                                  bottom: 5.h),
                                              child: Text(
                                                'LOCATION',
                                                style: appStyle(
                                                    5,
                                                    Color(mainTextColor.value),
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 45.w,
                                                  top: 5.h,
                                                  bottom: 5.h),
                                              child: Text(
                                                'STATUS',
                                                style: appStyle(
                                                    5,
                                                    Color(mainTextColor.value),
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(Icon(Icons.square_outlined,
                                                color: Color(lightHintTextColor
                                                        .value)
                                                    .withOpacity(0.4))),
                                            DataCell(Text(
                                              clients.companyName,
                                              style: appStyle(
                                                  4,
                                                  Color(mainTextColor.value),
                                                  FontWeight.w400),
                                            )),
                                            DataCell(Text(clients.companyEmail,
                                                style: appStyle(
                                                    4,
                                                    Color(mainTextColor.value),
                                                    FontWeight.w400))),
                                            DataCell(Text(clients.companyHq,
                                                style: appStyle(
                                                    4,
                                                    Color(mainTextColor.value),
                                                    FontWeight.w400))),
                                            DataCell(TextButton(
                                                onPressed: () {},
                                                child: Container(
                                                  width: 17.w,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Color(lightMain.value),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text('Paid',
                                                      style: appStyle(
                                                          3,
                                                          Color(
                                                              mainColor.value),
                                                          FontWeight.w400)),
                                                ))),
                                          ])
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                          )
                        : const Center(
                            child: Text('No influencers available'),
                          ));
          })
        ],
      ),
    );
  }
}
