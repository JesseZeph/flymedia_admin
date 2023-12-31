import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/controllers/login_provider.dart';
import 'package:flymedia_admin/views/common/exports.dart';
import 'package:flymedia_admin/views/common/width_spacer.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/client_widget.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/influencers_widget.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/overview_widget.dart';
import 'package:flymedia_admin/views/screens/dashboard/screens/widgets/logout_dialog.dart';
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
    const ClientPageWidget(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var name = context.watch<LoginNotifier>().fullName;
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
              const WidthSpacer(width: 350),
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
                        label: 'Clients',
                        isSelected: _selectedIndex == 2,
                        onTap: () => _onItemTapped(2),
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
                    'Super Admin',
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
