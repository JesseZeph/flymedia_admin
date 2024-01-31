import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymedia_admin/models/requests/auth/subscription_request.dart';
import 'package:flymedia_admin/models/response/subscription_response.dart';

const mainColor = Color(0xFF04C1C4);
const deepGreen = Color(0xFF02A6A9);
const iconColor = Color(0xFF7DA2C1);
const lightMain = Color(0xFFE7FFFF);
const dialogColor = Color(0xFFF2F4F7);
const dialogBlue = Color(0xFF0059D2);
const lightMainText = Color(0xFF5E5D5D);
const flyLight = Color(0xFFFFFFFF);
const mainTextColor = Color(0xFF2D2F34);
const lightHintTextColor = Color(0xFFAEAEAE);
const hintTextColor = Color(0xFF424242);
const errorColor = Color(0xFFE20404);
const greenTick = Color(0xFF079E3A);
const tileColor = Color(0xFFF4F6F8);
const purplePatch = Color(0xFF9747FF);
const orangeTint = Color(0xFFFFB629);
const flyGrey = Color(0xFFF0F2F6);

double height = 812.h;
double width = 375.w;

String username = '';
String userUid = '';
String profile = '';
String fullname = '';
SubscriptionResponse? subUpdate;
SubscriptionRequest? subReq;
