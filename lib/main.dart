import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/constants/app_constants.dart';
import 'package:flymedia_admin/controllers/profile_provider.dart';
import 'package:flymedia_admin/controllers/signup_provider.dart';
import 'package:flymedia_admin/controllers/users_provider.dart';
import 'package:flymedia_admin/controllers/verification_provider.dart';
import 'package:flymedia_admin/views/screens/auth/authpage.dart';
import 'package:flymedia_admin/views/screens/dashboard/overview.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/login_provider.dart';

Widget defaultHome = const AuthPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final entrypoint = prefs.getBool('entrypoint') ?? false;
  if (entrypoint == true) {
    defaultHome = const AdminOverview();
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ChangeNotifierProvider(create: (context) => SignupNotifier()),
    ChangeNotifierProvider(create: (context) => VerificationNotifier()),
    ChangeNotifierProvider(create: (context) => UsersNotifier()),
    ChangeNotifierProvider(create: (context) => ProfileProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flymedia Admin',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(flyLight.value),
              iconTheme: IconThemeData(color: Color(mainColor.value)),
              primarySwatch: Colors.grey,
            ),
            home: defaultHome,
          );
        });
  }
}
