import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/controllers/login_provider.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/auth/authpage.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/client_list.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/campaign_widget.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/influencers_widget.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/overview_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AdminOverview extends StatefulWidget {
  const AdminOverview({super.key});

  @override
  State<AdminOverview> createState() => _AdminOverviewState();
}

class _AdminOverviewState extends State<AdminOverview> {
  final List<Widget> _screens = [
    const OverviewPageWidget(),
    const InfluencersPageWidget(),
    const CampaignListPage(),
    const ClientListWidget(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var name = context.watch<LoginNotifier>().fullName;
    var userTypeText = context.watch<LoginNotifier>().userType;
    if (userTypeText == 'Admin') {
      userTypeText = 'Admin';
    } else {
      userTypeText = 'Super Admin';
    }
    // userTypeText == 'Admin'
    //     ? userTypeText = 'Super Admin'
    //     : userTypeText = 'Admin';
    return Scaffold(
      backgroundColor: Color(flyLight.value),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Color(flyLight.value),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Divider(
              height: 1,
              color: Color(lightHintTextColor.value).withOpacity(0.3),
            )),
        title: FittedBox(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset('assets/images/logo.png'),
              ),
              const WidthSpacer(width: 200),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomNavigationBar(
                    items: [
                      CustomNavigationItem(
                        label: 'Overview',
                        isSelected: _selectedIndex == 0,
                        onTap: () => _onItemTapped(0),
                      ),
                      CustomNavigationItem(
                        label: 'Influencers',
                        isSelected: _selectedIndex == 1,
                        onTap: () => _onItemTapped(1),
                      ),
                      CustomNavigationItem(
                        label: 'Campaigns',
                        isSelected: _selectedIndex == 2,
                        onTap: () => _onItemTapped(2),
                      ),
                      CustomNavigationItem(
                        label: 'Clients',
                        isSelected: _selectedIndex == 3,
                        onTap: () => _onItemTapped(3),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: Color(lightHintTextColor.value),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.r),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/tick.png',
                width: width * 0.08,
                height: height * 0.08,
              ),
              // Display a text or an icon in the avatar
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 13.h),
                  child: Text(
                    name,
                    style: appStyle(
                        3, Color(mainTextColor.value), FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: Text(
                    userTypeText,
                    style: appStyle(3, Color(mainColor.value), FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
          child: _screens[_selectedIndex]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 120.w),
        child: const DialogWidget(),
      );
    },
  );
}

class CustomNavigationBar extends StatelessWidget {
  final List<CustomNavigationItem> items;

  const CustomNavigationBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}

class CustomNavigationItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavigationItem({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? Color(mainColor.value)
                      : Color(mainTextColor.value),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Dialog(
      shadowColor: Color(lightHintTextColor.value),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(
          width: width * 0.4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Color(errorColor.value),
                    size: 8.sp,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Are you sure you want to logout of the account?',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 3.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: width * 0.08,
                      decoration: BoxDecoration(
                        color: Color(errorColor.value),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          loginNotifier.logout();
                          Get.offAll(() => const AuthPage());
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: Text(
                          'Log Out',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 3.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  const WidthSpacer(width: 20),
                  Expanded(
                    child: Container(
                      width: width * 0.08,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color(lightHintTextColor.value)),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 3.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
