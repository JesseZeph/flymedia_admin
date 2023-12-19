import 'package:flutter/material.dart';
import 'package:flymedia_admin/views/common/exports.dart';

class AdminOverview extends StatefulWidget {
  const AdminOverview({super.key});

  @override
  State<AdminOverview> createState() => _AdminOverviewState();
}

class _AdminOverviewState extends State<AdminOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(flyLight.value),
        body: Container(
          child: Center(child: Text('Overview')),
        ));
  }
}
